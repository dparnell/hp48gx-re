//! The speaker: BEEP switches OUT's speaker bit at its pitch, and the
//! machine logs the same changes at the same cycles whether the ROM is
//! interpreted, translated, or run with the natives too. Skipped when the
//! ROM is not present.

use hp48::{Key, Machine, CPU_HZ};

fn booted(install: fn(&mut Machine)) -> Option<Machine> {
    let rom = std::fs::read(hp48::default_rom_path()).ok()?;
    let mut m = Machine::new(&rom);
    install(&mut m);
    m.run(3 * CPU_HZ);
    m.tap(Key::F); // "Try To Recover Memory?" NO
    m.run(4 * CPU_HZ);
    m.hw.speaker.record = true;
    Some(m)
}

/// The speaker's changes while `line` runs, and the clock to play them at.
fn beep(install: fn(&mut Machine), line: &str) -> Option<(Vec<(u64, bool)>, f64)> {
    let mut m = booted(install)?;
    m.type_text(line).unwrap();
    m.hw.speaker.take();
    m.tap(Key::Enter);
    m.run(2 * CPU_HZ);
    Some((m.hw.speaker.take(), hp48::speaker::clock(&m)))
}

fn plain(_: &mut Machine) {}

fn translated(m: &mut Machine) {
    hp48_rom::install(m);
}

fn everything(m: &mut Machine) {
    hp48::hle::install(m);
    hp48_rom::install(m);
}

/// Played at `speaker::clock`, BEEP gives the pitch and length asked for.
#[test]
fn beep_plays_its_pitch_for_its_length() {
    for (line, want_hz, want_s) in [("1000 .5 BEEP", 1000.0, 0.5), ("440 .2 BEEP", 440.0, 0.2), ("2000 .1 BEEP", 2000.0, 0.1)] {
        let Some((edges, clock)) = beep(plain, line) else { return };
        let first = edges.first().unwrap().0;
        let last = edges.last().unwrap().0;
        let seconds = (last - first) as f64 / clock;
        let hz = (edges.len() / 2) as f64 / seconds;
        assert!((seconds / want_s - 1.0).abs() < 0.02, "{line}: {seconds} s");
        assert!((hz / want_hz - 1.0).abs() < 0.02, "{line}: {hz} Hz");
        // The level alternates, ending off.
        assert!(edges.windows(2).all(|w| w[0].1 != w[1].1), "{line}");
        assert!(!edges.last().unwrap().1, "{line}");
    }
}

#[test]
fn translated_code_logs_the_same_changes() {
    let Some(want) = beep(plain, "440 .2 BEEP") else { return };
    assert!(!want.0.is_empty());
    assert_eq!(beep(translated, "440 .2 BEEP").unwrap(), want, "translated");
    // Natives charge their own cycles before the beep starts, so compare
    // the tone itself: the spacing of the changes and their levels.
    let shape = |edges: &[(u64, bool)]| -> Vec<(u64, bool)> { edges.iter().map(|&(c, l)| (c - edges[0].0, l)).collect() };
    let natives = beep(everything, "440 .2 BEEP").unwrap().0;
    assert_eq!(shape(&natives), shape(&want.0), "natives and translated");
}

#[test]
fn nothing_is_logged_unless_recording() {
    let Some(mut m) = booted(plain) else { return };
    m.hw.speaker.record = false;
    m.type_text("1000 .2 BEEP").unwrap();
    m.tap(Key::Enter);
    m.run(CPU_HZ);
    assert!(m.hw.speaker.edges.is_empty());
}
