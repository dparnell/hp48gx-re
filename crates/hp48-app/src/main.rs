//! HP 48GX desktop calculator.
//!
//! hp48-app [--rom PATH] [--screenshot OUT.png] [--keys "K ..."] [--type "RPL text"]... [--persist] [--pixels] [--plot-only]
//!          [--layout auto|calculator|desktop] [--size WxH] [--line "RPL text"]... [--live] [--full-speed]
//!
//! The layout follows the window: a narrow window shows the calculator
//! alone; a wide one adds a desktop panel (desk.rs) with the stack as text,
//! the menu keys as buttons and a command line typed on the computer's
//! keyboard. The LCD's context menu can fix the layout.
//!
//! Ctrl+V types the clipboard text into the calculator. The plot window
//! opens by itself when the calculator shows its graphics screen (DRAW,
//! PICTURE), unless turned off in the LCD's context menu.
//!
//! State is kept in %APPDATA%/HP48GX/state.bin (or $XDG_DATA_HOME/HP48GX);
//! set HP48GX_STATE to use another file.
//!
//! The calculator runs on a thread of its own (runner.rs), and the window
//! is drawn again only when what it shows changes. At full speed (the
//! LCD's context menu, or --full-speed) the CPU runs as fast as the computer
//! allows, while the clock keeps real time. Scripted screenshot runs
//! step it frame by frame instead, unless given --live.

mod desk;
mod face;
mod persist;
mod plot;
mod runner;

use eframe::egui::{self, Align2, Color32, CornerRadius, FontId, Pos2, Rect, Sense, Stroke, UiBuilder, Vec2};
use face::{KeyCap, ShiftColor, Style, ROWS};
use hp48::{Key, Machine, CPU_HZ, LCD_HEIGHT, LCD_WIDTH};
use std::collections::{HashSet, VecDeque};
use std::sync::atomic::Ordering;
use std::sync::{Arc, Mutex, MutexGuard};
use std::time::{Duration, Instant};

// Layout in faceplate units; everything is scaled to the window.
const FACE_W: f32 = 60.0;
const FACE_H: f32 = 112.0;
const MARGIN: f32 = 2.0;
const LCD_TOP: f32 = 5.0;
const LCD_W: f32 = FACE_W - 2.0 * MARGIN - 2.0;
const LCD_H: f32 = LCD_W * LCD_HEIGHT as f32 / LCD_WIDTH as f32;
const KEYS_TOP: f32 = LCD_TOP + LCD_H + 5.0;
const ROW_PITCH: f32 = (FACE_H - KEYS_TOP - MARGIN) / 9.0;

const BODY: Color32 = Color32::from_rgb(0x2A, 0x2B, 0x30);
const BEZEL: Color32 = Color32::from_rgb(0x1B, 0x1C, 0x20);
const KEY_FACE: Color32 = Color32::from_rgb(0x46, 0x48, 0x50);
const KEY_FACE_NUM: Color32 = Color32::from_rgb(0x5A, 0x5C, 0x66);
const KEY_DOWN: Color32 = Color32::from_rgb(0x30, 0x31, 0x37);
const LEFT_SHIFT: Color32 = Color32::from_rgb(0xB0, 0x86, 0xD6);
const RIGHT_SHIFT: Color32 = Color32::from_rgb(0x63, 0xC2, 0x9A);
const ALPHA: Color32 = Color32::from_rgb(0xE8, 0xC2, 0x4A);
const LEGEND: Color32 = Color32::from_rgb(0xF2, 0xF2, 0xF2);
const LCD_BG: Color32 = Color32::from_rgb(0xBC, 0xC6, 0xA9);
const LCD_INK: Color32 = Color32::from_rgb(0x1E, 0x24, 0x1C);

#[derive(Clone, Copy, PartialEq, Eq)]
enum Display {
    /// The original 131x64 pixels, drawn as crisp squares.
    Pixels,
    /// Vectorised LCD content (hp48-vector).
    Vector,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum Layout {
    /// Desktop when the window is wide enough, else the calculator.
    Auto,
    Calculator,
    Desktop,
}

/// Narrowest window that gets the desktop layout in `Layout::Auto`.
const DESK_MIN_WIDTH: f32 = 760.0;

type SceneCache = Option<([[bool; LCD_WIDTH]; LCD_HEIGHT], std::rc::Rc<hp48_vector::Scene>)>;

struct App {
    /// Shared with the thread that runs it (runner.rs).
    machine: Arc<Mutex<Machine>>,
    runner: Option<runner::Runner>,
    speed: Arc<runner::Speed>,
    plot_open: bool,
    /// Debug: show the plot in the main window (for scripted screenshots).
    plot_only: bool,
    plot: plot::PlotWindow,
    /// Open the plot window when the calculator shows PICT.
    auto_plot: bool,
    /// The calculator was showing PICT on the last frame.
    showing_pict: bool,
    /// Pasted text waiting to be typed, the key currently held, and the
    /// machine time of the next press or release.
    typing: VecDeque<Key>,
    typing_down: Option<Key>,
    typing_at: u64,
    layout: Layout,
    desk: desk::Desk,
    display: Display,
    scene_cache: std::cell::RefCell<SceneCache>,
    /// The ROM's minifont, recognised in the LCD and drawn with a real font.
    minifont: hp48_vector::MiniFont,
    mouse_keys: HashSet<Key>,
    kb_keys: HashSet<Key>,
    screenshot: Option<(String, u32)>,
    /// --live: run the script in real time with the runner thread (the
    /// time of the last frame), and count the frames drawn once it is done.
    live: Option<Instant>,
    idle_frames: u32,
    script: Vec<(Key, bool, f64)>,
    script_time: f64,
    /// --line commands still to type (scripted runs).
    lines: Vec<String>,
    end_time: f64,
    /// Save continuous memory (off for scripted screenshot runs).
    persistent: bool,
}

impl App {
    /// `keys`: None means "wait one second".
    fn new(rom: &[u8], screenshot: Option<String>, keys: Vec<Option<Key>>, force_persist: bool) -> Self {
        // Key script for automated runs: press/release with timings.
        let mut script = Vec::new();
        let mut t = 3.5;
        for k in keys {
            match k {
                Some(k) => {
                    script.push((k, true, t));
                    script.push((k, false, t + 0.12));
                    t += 0.4;
                }
                None => t += 1.0,
            }
        }
        let end_time = t + 2.0;
        let persistent = screenshot.is_none() || force_persist;
        persist::set_rom(hp48::rom_hash(rom));
        let mut machine = Machine::new(rom);
        // Native Rust replacements for ROM routines, each verified against
        // the original (crates/hp48/tests/hle.rs).
        hp48::hle::install(&mut machine);
        // The rest of the ROM's machine code, translated into Rust.
        hp48_rom::install(&mut machine);
        if persistent {
            persist::load(&mut machine);
        }
        App {
            minifont: read_minifont(&machine),
            machine: Arc::new(Mutex::new(machine)),
            runner: None,
            speed: Arc::default(),
            plot_open: false,
            plot_only: false,
            plot: plot::PlotWindow::default(),
            auto_plot: true,
            showing_pict: false,
            typing: VecDeque::new(),
            typing_down: None,
            typing_at: 0,
            layout: Layout::Auto,
            desk: desk::Desk::default(),
            display: Display::Vector,
            scene_cache: std::cell::RefCell::new(None),
            persistent,
            mouse_keys: HashSet::new(),
            kb_keys: HashSet::new(),
            screenshot: screenshot.map(|p| (p, 0)),
            live: None,
            idle_frames: 0,
            script,
            script_time: 0.0,
            lines: Vec::new(),
            end_time,
        }
    }

    /// The machine, while the returned guard lives. Don't call another
    /// method that locks it meanwhile.
    fn m(&self) -> MutexGuard<'_, Machine> {
        self.machine.lock().unwrap()
    }

    fn save_state(&self) {
        if let Err(e) = persist::save(&self.m()) {
            eprintln!("could not save calculator state: {e}");
        }
    }

    fn set_key(&self, key: Key, down: bool) {
        self.m().key(key, down);
    }

    fn handle_keyboard(&mut self, ctx: &egui::Context) {
        // The desktop command line is being typed in.
        if self.desk.focused {
            return;
        }
        let events = ctx.input(|i| i.events.clone());
        for ev in events {
            match ev {
                egui::Event::Key { key, pressed, repeat: false, modifiers, .. } => {
                    let Some(k) = face::key_for(key) else { continue };
                    // Ctrl/Cmd shortcuts (Ctrl+V) are not calculator keys.
                    if pressed && !modifiers.command && self.kb_keys.insert(k) {
                        self.set_key(k, true);
                    } else if !pressed && self.kb_keys.remove(&k) {
                        self.set_key(k, false);
                    }
                }
                egui::Event::Paste(text) => self.type_text(&text),
                _ => {}
            }
        }
    }

    /// Queue `text` to be typed, dropping characters with no key.
    fn type_text(&mut self, text: &str) {
        let mut text = text.replace("\r\n", "\n");
        loop {
            match hp48::typing::keystrokes(&text) {
                Ok(keys) => break self.typing.extend(keys),
                Err(c) => text.retain(|t| t != c),
            }
        }
    }

    fn is_typing(&self) -> bool {
        !self.typing.is_empty() || self.typing_down.is_some()
    }

    /// Feed queued keystrokes: each held 50 ms, then 80 ms apart, in
    /// calculator time.
    fn feed_typing(&mut self, m: &mut Machine) {
        if m.time < self.typing_at {
            return;
        }
        if let Some(k) = self.typing_down.take() {
            m.key(k, false);
            self.typing_at = m.time + CPU_HZ * 8 / 100;
        } else if let Some(k) = self.typing.pop_front() {
            m.key(k, true);
            self.typing_down = Some(k);
            self.typing_at = m.time + CPU_HZ * 5 / 100;
        }
    }

    /// While text is being typed, run faster than real time (about 10 ms of
    /// work per frame, besides the runner thread's real time), so that a
    /// typed line takes a moment rather than seconds.
    fn type_ahead(&mut self) {
        let machine = self.machine.clone();
        let mut m = machine.lock().unwrap();
        let start = Instant::now();
        while self.is_typing() && start.elapsed().as_millis() < 10 {
            self.feed_typing(&mut m);
            m.run(CPU_HZ / 200);
        }
    }

    fn act(&mut self, action: desk::Action) {
        match action {
            desk::Action::Enter(text) => {
                self.type_text(&text);
                self.typing.push_back(Key::Enter);
            }
            desk::Action::Key(k) => self.typing.push_back(k),
        }
    }

    /// Open the plot window when the calculator switches to its graphics
    /// screen: the displayed grob (VDISP) becomes PICT (GDISP).
    fn watch_pict(&mut self) {
        const ADISP: u32 = 0x806D5;
        const VDISP: u32 = 0x806DA;
        const GDISP: u32 = 0x806E4;
        let machine = self.machine.clone();
        let m = machine.lock().unwrap();
        let [a, v, g] = [ADISP, VDISP, GDISP].map(|p| m.peek_value(p, 5));
        // While memory is being set up the pointers are not yet distinct.
        let pict = v == g && v != a && v >= 0x80000;
        if pict && !self.showing_pict && self.auto_plot {
            self.plot_open = true;
            self.plot.refresh(&m, true);
        }
        self.showing_pict = pict;
    }
}

impl eframe::App for App {
    /// The runner thread runs the calculator and asks for a repaint when
    /// what it shows changes; egui repaints on input too. Frames are only
    /// asked for here while typing ahead, and in scripted runs, which step
    /// the calculator frame by frame instead of with the thread.
    fn logic(&mut self, ctx: &egui::Context, _frame: &mut eframe::Frame) {
        if self.screenshot.is_some() {
            // Deterministic timing for scripted screenshots, or with --live
            // the wall clock and the runner thread, as in interactive use.
            let step = match &mut self.live {
                Some(last) => {
                    let now = Instant::now();
                    let dt = (now - *last).as_secs_f64();
                    *last = now;
                    dt
                }
                None => 1.0 / 30.0,
            };
            self.script_time += step;
            while let Some(&(k, down, t)) = self.script.first() {
                if t > self.script_time {
                    break;
                }
                self.script.remove(0);
                self.set_key(k, down);
            }
            // then the --line commands, typed as the desktop command line does
            if self.script.is_empty() && !self.is_typing() && !self.lines.is_empty() {
                let line = self.lines.remove(0);
                self.act(desk::Action::Enter(line));
                self.end_time = self.end_time.max(self.script_time + 2.0);
            }
            if self.is_typing() {
                self.end_time = self.end_time.max(self.script_time + 2.0);
            }
            if self.live.is_none() {
                let machine = self.machine.clone();
                let mut m = machine.lock().unwrap();
                self.feed_typing(&mut m);
                m.run((step * CPU_HZ as f64) as u64);
                ctx.request_repaint();
            } else if self.is_typing() {
                self.type_ahead();
                ctx.request_repaint();
            } else if let Some(&(_, _, t)) = self.script.first() {
                ctx.request_repaint_after(Duration::from_secs_f64((t - self.script_time).max(0.0)));
            } else {
                // From here frames come from the runner, when the display
                // changes, and once more to take the screenshot.
                self.idle_frames += 1;
                ctx.request_repaint_after(Duration::from_secs_f64((self.end_time - self.script_time).max(0.0) + 0.05));
            }
        } else if self.is_typing() {
            self.type_ahead();
            ctx.request_repaint();
        }
        self.handle_keyboard(ctx);
        self.watch_pict();
        self.screenshot_step(ctx);
    }

    fn on_exit(&mut self) {
        // Stop the thread first, so the state saved is the final one.
        self.runner = None;
        if self.persistent {
            self.save_state();
        }
    }

    fn ui(&mut self, ui: &mut egui::Ui, _frame: &mut eframe::Frame) {
        if self.plot_only {
            let machine = self.machine.clone();
            self.plot.refresh(&machine.lock().unwrap(), false);
            self.plot.ui(ui);
            return;
        }
        let full = ui.max_rect();
        ui.painter().rect_filled(full, CornerRadius::ZERO, Color32::from_rgb(0x12, 0x12, 0x14));
        let desktop = match self.layout {
            Layout::Auto => full.width() >= DESK_MIN_WIDTH && full.width() >= full.height(),
            Layout::Calculator => false,
            Layout::Desktop => true,
        };
        if !desktop {
            self.desk.focused = false;
            self.calculator_ui(ui, full);
            return;
        }
        // The calculator on the left at the window's height, the panel beside it.
        let calc_w = (full.height() * FACE_W / FACE_H).min(full.width() * 0.45);
        let calc = Rect::from_min_size(full.min, Vec2::new(calc_w, full.height()));
        self.calculator_ui(ui, calc);
        let panel = Rect::from_min_max(Pos2::new(calc.right(), full.top()), full.max);
        ui.painter().rect_filled(panel, CornerRadius::ZERO, desk::PANEL_BG);
        let machine = self.machine.clone();
        let actions = ui
            .scope_builder(UiBuilder::new().max_rect(panel.shrink(14.0)), |ui| {
                self.desk.ui(ui, &machine.lock().unwrap(), &self.minifont)
            })
            .inner;
        for a in actions {
            self.act(a);
        }
        // Start typing what was entered (logic types it ahead).
        if self.is_typing() {
            ui.ctx().request_repaint();
        }
    }
}

impl App {
    /// The calculator itself, scaled to fit `avail`.
    fn calculator_ui(&mut self, ui: &mut egui::Ui, avail: Rect) {
        let scale = (avail.width() / FACE_W).min(avail.height() / FACE_H);
        let origin = avail.center() - Vec2::new(FACE_W, FACE_H) * scale / 2.0;
        let to_screen = |x: f32, y: f32| origin + Vec2::new(x, y) * scale;
        let painter = ui.painter().clone();
        painter.rect_filled(
            Rect::from_min_max(to_screen(0.0, 0.0), to_screen(FACE_W, FACE_H)),
            CornerRadius::same((2.0 * scale) as u8),
            BODY,
        );

        self.draw_lcd(&painter, &to_screen, scale);
        let lcd_rect = Rect::from_min_max(to_screen(MARGIN, 1.0), to_screen(FACE_W - MARGIN, LCD_TOP + LCD_H + 2.0));
        let lcd_resp = ui.interact(lcd_rect, ui.id().with("lcd"), Sense::click());
        lcd_resp.context_menu(|ui| {
            ui.radio_value(&mut self.display, Display::Vector, "Vector display");
            ui.radio_value(&mut self.display, Display::Pixels, "Original pixels");
            ui.separator();
            ui.separator();
            ui.radio_value(&mut self.layout, Layout::Auto, "Layout follows the window");
            ui.radio_value(&mut self.layout, Layout::Calculator, "Calculator only");
            ui.radio_value(&mut self.layout, Layout::Desktop, "Desktop panel");
            ui.separator();
            ui.checkbox(&mut self.plot_open, "Plot window");
            ui.checkbox(&mut self.auto_plot, "Open plot window on DRAW");
            ui.separator();
            let mut full = self.speed.full.load(Ordering::Relaxed);
            let mhz = f64::from(self.speed.khz.load(Ordering::Relaxed)) / 1000.0;
            let label = if full { format!("Full speed (now {mhz:.0} MHz)") } else { "Full speed (else 4 MHz)".to_string() };
            if ui.checkbox(&mut full, label).changed() {
                self.speed.full.store(full, Ordering::Relaxed);
            }
        });
        if self.plot_open {
            self.show_plot(ui.ctx());
        }

        let mut new_mouse: HashSet<Key> = HashSet::new();
        let keyboard_live = self.m().hw.keyboard.input(0x1FF) != 0;
        for (row_i, row) in ROWS.iter().enumerate() {
            // ENTER is double width, so its row also uses a six-column grid.
            let cols: f32 = if row_i < 5 { 6.0 } else { 5.0 };
            let col_w = (FACE_W - 2.0 * MARGIN) / cols;
            let y = KEYS_TOP + row_i as f32 * ROW_PITCH;
            let mut col = 0.0;
            for cap in row.iter() {
                let x = MARGIN + col * col_w;
                col += cap.span;
                let w = col_w * cap.span;
                let key_rect = Rect::from_min_max(
                    to_screen(x + 0.6, y + ROW_PITCH * 0.38),
                    to_screen(x + w - 0.6, y + ROW_PITCH * 0.92),
                );
                let resp = ui.interact(key_rect, ui.id().with(("key", cap.key)), Sense::click_and_drag());
                if resp.is_pointer_button_down_on() {
                    new_mouse.insert(cap.key);
                }
                let down = keyboard_live && (self.mouse_keys.contains(&cap.key) || self.kb_keys.contains(&cap.key));
                draw_key(&painter, cap, key_rect, Rect::from_min_max(to_screen(x, y), to_screen(x + w, y + ROW_PITCH)), scale, down);
            }
        }
        // Mouse press/release edges.
        let pressed: Vec<Key> = new_mouse.difference(&self.mouse_keys).copied().collect();
        let released: Vec<Key> = self.mouse_keys.difference(&new_mouse).copied().collect();
        for k in pressed {
            self.set_key(k, true);
        }
        for k in released {
            self.set_key(k, false);
        }
        self.mouse_keys = new_mouse;

    }
}

impl App {
    fn show_plot(&mut self, ctx: &egui::Context) {
        let machine = self.machine.clone();
        self.plot.refresh(&machine.lock().unwrap(), false);
        let builder = egui::ViewportBuilder::default()
            .with_title("HP 48GX Plot")
            .with_inner_size([720.0, 480.0])
            .with_min_inner_size([240.0, 160.0]);
        let plot = &mut self.plot;
        let mut close = false;
        ctx.show_viewport_immediate(egui::ViewportId::from_hash_of("hp48-plot"), builder, |ui, _class| {
            plot.ui(ui);
            if ui.ctx().input(|i| i.viewport().close_requested()) {
                close = true;
            }
        });
        if close {
            self.plot_open = false;
        }
    }

    /// Scripted runs: once the key script has finished, grab a frame and exit.
    fn screenshot_step(&mut self, ctx: &egui::Context) {
        let done = self.script.is_empty() && self.lines.is_empty() && !self.is_typing();
        let Some((path, frames)) = &mut self.screenshot else { return };
        *frames += 1;
        if *frames % 60 == 0 {
            eprintln!("script time {:.1}s / {:.1}s", self.script_time, self.end_time);
        }
        if done && self.script_time > self.end_time {
            ctx.send_viewport_cmd(egui::ViewportCommand::Screenshot(egui::UserData::default()));
        }
        let shot = ctx.input(|i| {
            i.events.iter().find_map(|e| match e {
                egui::Event::Screenshot { image, .. } => Some(image.clone()),
                _ => None,
            })
        });
        if let Some(image) = shot {
            if self.live.is_some() {
                let mhz = f64::from(self.speed.khz.load(Ordering::Relaxed)) / 1000.0;
                eprintln!("{} frames drawn after the script ended; CPU at {mhz:.0} MHz", self.idle_frames);
            }
            save_png(path, &image);
            ctx.send_viewport_cmd(egui::ViewportCommand::Close);
        }
    }

    fn draw_lcd(&self, painter: &egui::Painter, to_screen: &dyn Fn(f32, f32) -> Pos2, scale: f32) {
        let lcd = self.m().lcd();
        let x0 = MARGIN + 1.0;
        let bezel = Rect::from_min_max(to_screen(MARGIN, 1.0), to_screen(FACE_W - MARGIN, LCD_TOP + LCD_H + 2.0));
        painter.rect_filled(bezel, CornerRadius::same((1.0 * scale) as u8), BEZEL);
        let screen = Rect::from_min_max(to_screen(x0, LCD_TOP - 2.5), to_screen(x0 + LCD_W, LCD_TOP + LCD_H + 0.5));
        painter.rect_filled(screen, CornerRadius::same((0.5 * scale) as u8), LCD_BG);

        // Annunciators.
        if lcd.annunciators & 0x80 != 0 {
            let names: [(u8, &str); 6] = [(0x01, "⬑"), (0x02, "⬏"), (0x04, "α"), (0x08, "((•))"), (0x10, "BUSY"), (0x20, "I/O")];
            for (i, (bit, txt)) in names.iter().enumerate() {
                if lcd.annunciators & bit != 0 {
                    let p = to_screen(x0 + 4.0 + i as f32 * LCD_W / 6.0, LCD_TOP - 1.2);
                    painter.text(p, Align2::CENTER_CENTER, *txt, FontId::proportional(1.6 * scale), LCD_INK);
                }
            }
        }
        if !lcd.on {
            return;
        }
        let px = LCD_W / LCD_WIDTH as f32;
        let pt = |x: f32, y: f32| to_screen(x0 + x * px, LCD_TOP + y * px);
        match self.display {
            Display::Pixels => {
                for (y, row) in lcd.pixels.iter().enumerate() {
                    let mut x = 0;
                    while x < LCD_WIDTH {
                        if !row[x] {
                            x += 1;
                            continue;
                        }
                        // Merge horizontal runs into one rectangle.
                        let start = x;
                        while x < LCD_WIDTH && row[x] {
                            x += 1;
                        }
                        let r = Rect::from_min_max(pt(start as f32, y as f32), pt(x as f32, (y + 1) as f32));
                        painter.rect_filled(r, CornerRadius::ZERO, LCD_INK);
                    }
                }
            }
            Display::Vector => {
                let scene = self.vector_scene(&lcd);
                for r in &scene.fills {
                    painter.rect_filled(Rect::from_min_max(pt(r.x, r.y), pt(r.x + r.w, r.y + r.h)), CornerRadius::ZERO, LCD_INK);
                }
                for d in &scene.dots {
                    let c = pt(d.x, d.y);
                    painter.circle_filled(c, d.r * px * scale, LCD_INK);
                }
                let width = STROKE_WIDTH * px * scale;
                for (lines, color) in [(&scene.dark, LCD_INK), (&scene.light, LCD_BG)] {
                    for pl in lines.iter() {
                        draw_polyline(painter, pl, width, color, &pt);
                    }
                }
                for t in &scene.text {
                    draw_mini_text(painter, t, &pt, if t.light { LCD_BG } else { LCD_INK });
                }
            }
        }
    }

    /// The vectorised LCD, recomputed only when the pixels change.
    fn vector_scene(&self, lcd: &hp48::Lcd) -> std::rc::Rc<hp48_vector::Scene> {
        let mut cache = self.scene_cache.borrow_mut();
        if let Some((pixels, scene)) = cache.as_ref() {
            if pixels == &lcd.pixels {
                return scene.clone();
            }
        }
        let scene = std::rc::Rc::new(hp48_vector::vectorize_with(&hp48_vector::Bitmap::from_rows(&lcd.pixels), Some(&self.minifont)));
        *cache = Some((lcd.pixels, scene.clone()));
        scene
    }
}

/// Stroke width of vectorised LCD lines, in LCD pixels.
pub(crate) const STROKE_WIDTH: f32 = 0.92;

pub(crate) fn draw_polyline(
    painter: &egui::Painter,
    pl: &hp48_vector::Polyline,
    width: f32,
    color: Color32,
    pt: &dyn Fn(f32, f32) -> Pos2,
) {
    let pts: Vec<Pos2> = pl.points.iter().map(|p| pt(p[0], p[1])).collect();
    let stroke = Stroke::new(width, color);
    match pts.len() {
        0 => {}
        1 => {
            painter.circle_filled(pts[0], width / 2.0, color);
        }
        _ => {
            if pl.closed {
                painter.add(egui::Shape::closed_line(pts, stroke));
            } else {
                // Round caps.
                painter.circle_filled(pts[0], width / 2.0, color);
                painter.circle_filled(*pts.last().unwrap(), width / 2.0, color);
                painter.add(egui::Shape::line(pts, stroke));
            }
        }
    }
}

fn draw_key(painter: &egui::Painter, cap: &KeyCap, key: Rect, cell: Rect, scale: f32, down: bool) {
    let face = match cap.style {
        Style::Shift(ShiftColor::Left) => LEFT_SHIFT,
        Style::Shift(ShiftColor::Right) => RIGHT_SHIFT,
        Style::Shift(ShiftColor::Alpha) => ALPHA,
        Style::Number => KEY_FACE_NUM,
        Style::Menu => Color32::from_rgb(0xDE, 0xDE, 0xE2),
        Style::Normal => KEY_FACE,
    };
    let face = if down { KEY_DOWN } else { face };
    let r = CornerRadius::same((0.7 * scale) as u8);
    painter.rect_filled(key.translate(Vec2::new(0.0, 0.25 * scale)), r, Color32::from_black_alpha(140));
    painter.rect_filled(key, r, face);
    painter.rect_stroke(key, r, Stroke::new(0.08 * scale, Color32::from_black_alpha(90)), egui::StrokeKind::Inside);

    let text_color = match cap.style {
        Style::Shift(_) | Style::Menu => Color32::from_rgb(0x20, 0x20, 0x24),
        _ => LEGEND,
    };
    let main_size = if cap.label.chars().count() > 3 { 1.8 } else { 2.4 };
    painter.text(key.center(), Align2::CENTER_CENTER, cap.label, FontId::new(main_size * scale, bold()), text_color);

    let legend_y = cell.top() + cell.height() * 0.2;
    // Shrink the shifted legends if both together would not fit above the key.
    let measure = |t: &str, size: f32| {
        if t.is_empty() {
            0.0
        } else {
            painter.layout_no_wrap(t.to_string(), FontId::proportional(size), LEGEND).size().x
        }
    };
    let mut size = 1.45 * scale;
    let room = key.width();
    let need = measure(cap.left, size) + measure(cap.right, size) + 0.6 * scale;
    if need > room {
        size *= room / need;
    }
    let small = FontId::proportional(size);
    match (cap.left.is_empty(), cap.right.is_empty()) {
        (false, false) => {
            painter.text(Pos2::new(key.left(), legend_y), Align2::LEFT_CENTER, cap.left, small.clone(), LEFT_SHIFT);
            painter.text(Pos2::new(key.right(), legend_y), Align2::RIGHT_CENTER, cap.right, small.clone(), RIGHT_SHIFT);
        }
        (false, true) => {
            painter.text(Pos2::new(key.left(), legend_y), Align2::LEFT_CENTER, cap.left, small.clone(), LEFT_SHIFT);
        }
        (true, false) => {
            painter.text(Pos2::new(key.right(), legend_y), Align2::RIGHT_CENTER, cap.right, small.clone(), RIGHT_SHIFT);
        }
        _ => {}
    }
    if !cap.alpha.is_empty() {
        painter.text(
            Pos2::new(key.right() + 0.5 * scale, key.bottom()),
            Align2::LEFT_BOTTOM,
            cap.alpha,
            FontId::proportional(1.4 * scale),
            ALPHA,
        );
    }
}

fn bold() -> egui::FontFamily {
    egui::FontFamily::Name("bold".into())
}

/// The font for the calculator's minifont text (path, menu labels).
fn mini() -> egui::FontFamily {
    egui::FontFamily::Name("mini".into())
}

/// The ROM's minifont, for recognising its text on the LCD (`tools/fonts.py`
/// describes the layout). Lowercase letters share the capitals' glyphs.
fn read_minifont(m: &Machine) -> hp48_vector::MiniFont {
    const GLYPHS: usize = 0x7C102;
    const REMAP: usize = 0x7C793;
    let rom = &m.hw.rom;
    let byte = |a: usize| rom[a] | rom[a + 1] << 4;
    let glyphs = (0x20..=0xFFu8).filter(|c| !c.is_ascii_lowercase()).map(|code| {
        let c = if code > 0x9F { byte(REMAP + 2 * usize::from(code - 0x9F)) } else { code };
        let index = match c {
            0..=0x60 => usize::from(c),
            0x61..=0x7A => usize::from(c) - 0x20,
            _ => usize::from(c) - 0x1A,
        };
        let a = GLYPHS + 11 * index;
        hp48_vector::Glyph {
            ch: hp48_rpl::hp_char(code),
            width: usize::from(rom[a]),
            rows: std::array::from_fn(|r| byte(a + 1 + 2 * r)),
        }
    });
    hp48_vector::MiniFont::new(glyphs)
}

/// Draw recognised minifont text with a real font: capitals as tall as the
/// glyphs' 5 rows, centred on their ink. Text wider than the ink is set
/// tighter, then smaller. `pt` maps LCD pixel coordinates to the screen.
pub(crate) fn draw_mini_text(painter: &egui::Painter, t: &hp48_vector::Text, pt: &dyn Fn(f32, f32) -> Pos2, color: Color32) {
    // DejaVu Sans: capitals are 0.729 em tall, their tops 0.199 em below
    // the top of the line.
    const CAP: f32 = 0.729;
    const CAP_TOP: f32 = 0.199;
    let px = pt(1.0, 0.0).x - pt(0.0, 0.0).x;
    let room = (t.w + 0.5) * px;
    let gaps = t.text.chars().count().saturating_sub(1) as f32;
    let layout = |size: f32, spacing: f32| {
        let mut job = egui::text::LayoutJob::default();
        let format = egui::TextFormat { font_id: FontId::new(size, mini()), color, extra_letter_spacing: spacing, ..Default::default() };
        job.append(&t.text, 0.0, format);
        painter.layout_job(job)
    };
    let mut size = 5.0 * px / CAP;
    let mut galley = layout(size, 0.0);
    if galley.size().x > room {
        let spacing = ((room - galley.size().x) / gaps.max(1.0)).max(-0.06 * size);
        galley = layout(size, spacing);
        if galley.size().x > room {
            size *= room / galley.size().x;
            galley = layout(size, spacing * room / galley.size().x);
        }
    }
    let centre = pt(t.x + t.w / 2.0, t.y + 2.5);
    let pos = Pos2::new(centre.x - galley.size().x / 2.0, centre.y - CAP * size / 2.0 - CAP_TOP * size);
    painter.galley(pos, galley, color);
}

/// DejaVu Sans covers the calculator's symbols (▲ ▼ → ˣ ∡ ↵ ∫ ∂ ...).
fn install_fonts(ctx: &egui::Context) {
    use std::sync::Arc;
    let mut fonts = egui::FontDefinitions::default();
    fonts.font_data.insert(
        "dejavu".into(),
        Arc::new(egui::FontData::from_static(include_bytes!("../assets/DejaVuSans.ttf"))),
    );
    fonts.font_data.insert(
        "dejavu-bold".into(),
        Arc::new(egui::FontData::from_static(include_bytes!("../assets/DejaVuSans-Bold.ttf"))),
    );
    fonts.families.entry(egui::FontFamily::Proportional).or_default().insert(0, "dejavu".into());
    fonts.font_data.insert(
        "dejavu-condensed-bold".into(),
        Arc::new(egui::FontData::from_static(include_bytes!("../assets/DejaVuSansCondensed-Bold.ttf"))),
    );
    fonts.families.insert(bold(), vec!["dejavu-bold".into(), "dejavu".into()]);
    fonts.families.insert(mini(), vec!["dejavu-condensed-bold".into(), "dejavu-bold".into(), "dejavu".into()]);
    ctx.set_fonts(fonts);
}

fn save_png(path: &str, image: &egui::ColorImage) {
    let [w, h] = image.size;
    let mut raw = Vec::with_capacity(w * h * 3);
    for p in &image.pixels {
        raw.extend_from_slice(&[p.r(), p.g(), p.b()]);
    }
    let file = std::fs::File::create(path).expect("create screenshot");
    let mut enc = png::Encoder::new(std::io::BufWriter::new(file), w as u32, h as u32);
    enc.set_color(png::ColorType::Rgb);
    enc.set_depth(png::BitDepth::Eight);
    enc.write_header().and_then(|mut wr| wr.write_image_data(&raw)).expect("write png");
}

fn main() -> eframe::Result {
    let mut args = std::env::args().skip(1);
    let mut rom_path = hp48::default_rom_path().display().to_string();
    let mut screenshot = None;
    let mut keys = Vec::new();
    let mut lines = Vec::new();
    let mut force_persist = false;
    let mut pixels = false;
    let mut plot_only = false;
    let mut live = false;
    let mut full_speed = false;
    let mut natives = true;
    let mut layout = Layout::Auto;
    let mut size = [420.0, 784.0];
    while let Some(a) = args.next() {
        match a.as_str() {
            "--persist" => force_persist = true,
            "--line" => lines.push(args.next().expect("--line TEXT")),
            "--pixels" => pixels = true,
            "--no-natives" => natives = false,
            "--plot-only" => plot_only = true,
            "--live" => live = true,
            "--full-speed" => full_speed = true,
            "--layout" => {
                layout = match args.next().as_deref() {
                    Some("auto") => Layout::Auto,
                    Some("calculator") => Layout::Calculator,
                    Some("desktop") => Layout::Desktop,
                    other => panic!("--layout auto|calculator|desktop, not {other:?}"),
                }
            }
            "--size" => {
                let s = args.next().expect("--size WxH");
                let (w, h) = s.split_once('x').expect("--size WxH");
                size = [w.parse().expect("width"), h.parse().expect("height")];
            }
            "--rom" => rom_path = args.next().expect("--rom PATH"),
            "--screenshot" => screenshot = args.next(),
            "--type" => {
                let text = args.next().expect("--type TEXT");
                let typed = hp48::typing::keystrokes(&text).unwrap_or_else(|c| panic!("cannot type {c:?}"));
                keys.extend(typed.into_iter().map(Some));
                keys.push(Some(Key::Enter));
                keys.push(None);
            }
            "--keys" => {
                keys = args
                    .next()
                    .expect("--keys LIST")
                    .split_whitespace()
                    .map(|n| {
                        if n.eq_ignore_ascii_case("wait") {
                            return None;
                        }
                        Some(Key::ALL
                            .into_iter()
                            .find(|k| format!("{k:?}").eq_ignore_ascii_case(n) || format!("{k:?}").eq_ignore_ascii_case(&format!("N{n}")))
                            .unwrap_or_else(|| panic!("unknown key {n}")))
                    })
                    .collect::<Vec<_>>()
                    .into_iter()
                    .chain(keys.drain(..))
                    .collect()
            }
            other => panic!("unknown argument {other}"),
        }
    }
    let rom = std::fs::read(&rom_path).unwrap_or_else(|e| panic!("reading {rom_path}: {e}"));
    let options = eframe::NativeOptions {
        viewport: egui::ViewportBuilder::default()
            .with_title("HP 48GX")
            .with_inner_size(size)
            .with_min_inner_size([200.0, 370.0]),
        ..Default::default()
    };
    eframe::run_native(
        "HP 48GX",
        options,
        Box::new(move |cc| {
            install_fonts(&cc.egui_ctx);
            let scripted = screenshot.is_some();
            let mut app = App::new(&rom, screenshot, keys, force_persist);
            app.lines = lines;
            if !natives {
                let mut m = app.m();
                m.natives.clear();
                m.jumps.clear();
                m.blocks = None;
            }
            if live {
                app.live = Some(Instant::now());
            }
            if !scripted || live {
                app.speed.full.store(full_speed, Ordering::Relaxed);
                let speed = app.speed.clone();
                app.runner = Some(runner::Runner::start(app.machine.clone(), cc.egui_ctx.clone(), app.persistent, speed));
            }
            if pixels {
                app.display = Display::Pixels;
            }
            app.plot_only = plot_only;
            app.layout = layout;
            Ok(Box::new(app))
        }),
    )
}
