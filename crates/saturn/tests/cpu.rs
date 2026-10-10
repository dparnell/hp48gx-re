//! Execution semantics of the Saturn core (docs/cpu.txt §5.3).

use saturn::{Bus, Cpu, Reg};

/// Flat 1M-nibble memory with no peripherals.
struct Mem(Vec<u8>);

impl Mem {
    fn with_code(code: &str) -> Self {
        let mut m = vec![0u8; 0x10_0000];
        for (i, c) in code.chars().filter(|c| !c.is_whitespace()).enumerate() {
            m[i] = c.to_digit(16).unwrap() as u8;
        }
        Mem(m)
    }
}

impl Bus for Mem {
    fn fetch(&mut self, a: u32) -> u8 {
        self.0[a as usize]
    }
    fn read(&mut self, a: u32) -> u8 {
        self.0[a as usize]
    }
    fn write(&mut self, a: u32, v: u8) {
        self.0[a as usize] = v;
    }
    fn config(&mut self, _: u32) {}
    fn unconfig(&mut self, _: u32) {}
    fn reset_config(&mut self) {}
    fn chip_id(&mut self) -> u32 {
        0
    }
    fn input(&mut self, _: u16) -> u16 {
        0
    }
    fn keys_down(&mut self, _: u16) -> bool {
        false
    }
}

fn run(code: &str, steps: usize, setup: impl FnOnce(&mut Cpu)) -> (Cpu, Mem) {
    let mut mem = Mem::with_code(code);
    let mut cpu = Cpu::new();
    setup(&mut cpu);
    for _ in 0..steps {
        cpu.step(&mut mem);
    }
    (cpu, mem)
}

#[test]
fn hex_add_sets_carry_on_overflow() {
    // C2: C=C+A A
    let (cpu, _) = run("C2", 1, |c| {
        c.a = Reg(0x00001);
        c.c = Reg(0xFFFFF);
    });
    assert_eq!(cpu.c.a(), 0);
    assert!(cpu.carry);
}

#[test]
fn decimal_add_uses_bcd_digits() {
    // 05 SETDEC; C2 C=C+A A
    let (cpu, _) = run("05 C2", 2, |c| {
        c.a = Reg(0x00019);
        c.c = Reg(0x00023);
    });
    assert_eq!(cpu.c.a(), 0x00042);
    assert!(!cpu.carry);
    let (cpu, _) = run("05 C2", 2, |c| {
        c.a = Reg(0x99999);
        c.c = Reg(0x00001);
    });
    assert_eq!(cpu.c.a(), 0);
    assert!(cpu.carry);
}

#[test]
fn negate_sets_carry_unless_zero() {
    // F8: A=-A A (two's complement)
    let (cpu, _) = run("F8", 1, |c| c.a = Reg(1));
    assert_eq!(cpu.a.a(), 0xFFFFF);
    assert!(cpu.carry);
    let (cpu, _) = run("F8", 1, |c| c.a = Reg(0));
    assert_eq!(cpu.a.a(), 0);
    assert!(!cpu.carry);
}

#[test]
fn field_ops_leave_other_nibbles_alone() {
    // A6: C=C+C B (field B = nibbles 0-1)
    let (cpu, _) = run("A6 6", 1, |c| c.c = Reg(0x1234_5678_9ABC_DEF0));
    assert_eq!(cpu.c.0, 0x1234_5678_9ABC_DEE0);
}

#[test]
fn load_constant_starts_at_p_and_wraps() {
    // 2F P=15; 31 21 LC(2) #12  -> nibble 15 = 2, nibble 0 = 1
    let (cpu, _) = run("2F 31 21", 2, |_| {});
    assert_eq!(cpu.c.nib(15), 2);
    assert_eq!(cpu.c.nib(0), 1);
}

#[test]
fn gosub_and_return() {
    // 0000: GOSUB +4 -> 0008; 0004: P=1; 0006: (unused); 0008: RTN
    // 7400 = GOSUB with offset 4 from pc+4 = 8
    let (cpu, _) = run("7400 21 00 01", 3, |_| {});
    assert_eq!(cpu.p, 1, "returned to the instruction after GOSUB");
}

#[test]
fn memory_store_and_load_through_d0() {
    // 1B 00010  D0=(5) #01000 ; 144 DAT0=C A ; 164 D0=D0+5 ; 142 A=DAT0 A (reads next 5)
    let (cpu, mem) = run("1B00010 144 164 142", 4, |c| c.c = Reg(0xABCDE));
    assert_eq!(&mem.0[0x1000..0x1005], &[0xE, 0xD, 0xC, 0xB, 0xA]);
    assert_eq!(cpu.d0, 0x1005);
    assert_eq!(cpu.a.a(), 0);
}

#[test]
fn test_with_goyes_branches_and_sets_carry() {
    // 8A600 at 0: ?C#A A / GOYES +6 from offset field (pc+3) -> 0009
    let (cpu, _) = run("8A660", 1, |c| {
        c.a = Reg(1);
        c.c = Reg(2);
    });
    assert!(cpu.carry);
    assert_eq!(cpu.pc, 0x00009);
}

#[test]
fn return_stack_holds_eight_entries() {
    let mut mem = Mem::with_code("06060606060606060606"); // RSTK=C x10
    let mut cpu = Cpu::new();
    for i in 0..10u32 {
        cpu.c = Reg(u64::from(i));
        cpu.step(&mut mem);
    }
    assert_eq!(cpu.rstk(), &[2, 3, 4, 5, 6, 7, 8, 9]);
}
