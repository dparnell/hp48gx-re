//! Store variables and an equation, then read them back with hp48-rpl.
use hp48::{Key, Machine, CPU_HZ};
use hp48_rpl::{decode, dir_entries, expr, lookup_var, Memory, USEROB};

struct Ram<'a>(&'a Machine);
impl Memory for Ram<'_> {
    fn nib(&self, a: u32) -> u8 {
        self.0.hw.peek(a)
    }
}

fn main() {
    let rom = std::fs::read("ROM/gxrom-r").unwrap();
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    let keys = [
        // 1 'A' STO
        Key::N1, Key::Quote, Key::Alpha, Key::A, Key::Enter, Key::Sto,
        // 2 'BC' STO
        Key::N2, Key::Quote, Key::Alpha, Key::B, Key::Alpha, Key::C, Key::Enter, Key::Sto,
        // 'SIN(X)+1' 'EQ' STO
        Key::Quote, Key::Sin, Key::Alpha, Key::Inv, Key::Right, Key::Plus, Key::N1, Key::Enter,
        Key::Quote, Key::Alpha, Key::E, Key::Alpha, Key::Down, Key::Enter, Key::Sto,
    ];
    for k in keys {
        m.tap(k);
    }
    m.run(CPU_HZ);
    let mem = Ram(&m);
    let home = mem.addr(USEROB);
    let libs = mem.value(home + 5, 3) as u32;
    let field = home + 8 + 13 * libs;
    let hex: String = (field..field + 200).map(|a| format!("{:X}", mem.nib(a))).collect();
    println!("last-entry field at {field:05X}: offset {:05X}", mem.addr(field));
    for (i, c) in hex.as_bytes().chunks(50).enumerate() {
        println!("{:05X} {}", field as usize + 50 * i, std::str::from_utf8(c).unwrap());
    }
    for (name, addr) in dir_entries(&mem, home) {
        println!("{name:>6} @ {addr:05X}: {:?}", decode(&mem, addr).map(|o| format!("{o:?}")).unwrap_or_else(|e| e.to_string()));
    }
    if let Some(a) = lookup_var(&mem, "EQ") {
        let obj = decode(&mem, a).unwrap();
        let e = expr::compile(&obj).unwrap();
        let f = |x: f64| e.eval(&|n| (n == "X").then_some(x), expr::Angle::Degrees);
        println!("EQ = {e};  EQ(30 deg) = {}", f(30.0));
    }
}
