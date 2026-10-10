//! HP 48GX desktop calculator.
//!
//! hp48-app [--rom PATH] [--screenshot OUT.png] [--keys "K ..."] [--persist] [--pixels]
//!
//! State is kept in %APPDATA%/HP48GX/state.bin (or $XDG_DATA_HOME/HP48GX);
//! set HP48GX_STATE to use another file.

mod face;
mod persist;

use eframe::egui::{self, Align2, Color32, CornerRadius, FontId, Pos2, Rect, Sense, Stroke, Vec2};
use face::{KeyCap, ShiftColor, Style, ROWS};
use hp48::{Key, Machine, CPU_HZ, LCD_HEIGHT, LCD_WIDTH};
use std::collections::HashSet;
use std::time::Instant;

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

type SceneCache = Option<([[bool; LCD_WIDTH]; LCD_HEIGHT], std::rc::Rc<hp48_vector::Scene>)>;

struct App {
    machine: Machine,
    display: Display,
    scene_cache: std::cell::RefCell<SceneCache>,
    last: Option<Instant>,
    mouse_keys: HashSet<Key>,
    kb_keys: HashSet<Key>,
    screenshot: Option<(String, u32)>,
    script: Vec<(Key, bool, f64)>,
    script_time: f64,
    end_time: f64,
    /// Save continuous memory (off for scripted screenshot runs).
    persistent: bool,
    last_save: Instant,
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
        let mut machine = Machine::new(rom);
        if persistent {
            persist::load(&mut machine);
        }
        App {
            machine,
            display: Display::Vector,
            scene_cache: std::cell::RefCell::new(None),
            persistent,
            last_save: Instant::now(),
            last: None,
            mouse_keys: HashSet::new(),
            kb_keys: HashSet::new(),
            screenshot: screenshot.map(|p| (p, 0)),
            script,
            script_time: 0.0,
            end_time,
        }
    }

    fn save(&mut self) {
        if let Err(e) = persist::save(&self.machine) {
            eprintln!("could not save calculator state: {e}");
        }
        self.last_save = Instant::now();
    }

    fn set_key(&mut self, key: Key, down: bool) {
        self.machine.key(key, down);
    }

    fn handle_keyboard(&mut self, ctx: &egui::Context) {
        let events = ctx.input(|i| i.events.clone());
        for ev in events {
            if let egui::Event::Key { key, pressed, repeat: false, .. } = ev {
                if let Some(k) = face::key_for(key) {
                    if pressed && self.kb_keys.insert(k) {
                        self.set_key(k, true);
                    } else if !pressed && self.kb_keys.remove(&k) {
                        self.set_key(k, false);
                    }
                }
            }
        }
    }
}

impl eframe::App for App {
    fn logic(&mut self, ctx: &egui::Context, _frame: &mut eframe::Frame) {
        let now = Instant::now();
        let dt = self.last.map_or(1.0 / 60.0, |l| (now - l).as_secs_f64()).min(0.1);
        self.last = Some(now);
        if self.screenshot.is_some() {
            // Deterministic timing for scripted screenshots.
            let step = 1.0 / 30.0;
            self.script_time += step;
            while let Some(&(k, down, t)) = self.script.first() {
                if t > self.script_time {
                    break;
                }
                self.script.remove(0);
                self.set_key(k, down);
            }
            self.machine.run((step * CPU_HZ as f64) as u64);
        } else {
            self.machine.run((dt * CPU_HZ as f64) as u64);
        }
        self.handle_keyboard(ctx);
        self.screenshot_step(ctx);
        if self.persistent && self.last_save.elapsed().as_secs() >= 60 {
            self.save();
        }
        ctx.request_repaint();
    }

    fn on_exit(&mut self) {
        if self.persistent {
            self.save();
        }
    }

    fn ui(&mut self, ui: &mut egui::Ui, _frame: &mut eframe::Frame) {
        let avail = ui.max_rect();
        let scale = (avail.width() / FACE_W).min(avail.height() / FACE_H);
        let origin = avail.center() - Vec2::new(FACE_W, FACE_H) * scale / 2.0;
        let to_screen = |x: f32, y: f32| origin + Vec2::new(x, y) * scale;
        let painter = ui.painter().clone();
        painter.rect_filled(avail, CornerRadius::ZERO, Color32::from_rgb(0x12, 0x12, 0x14));
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
        });

        let mut new_mouse: HashSet<Key> = HashSet::new();
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
                let down = self.machine.hw.keyboard.input(0x1FF) != 0
                    && (self.mouse_keys.contains(&cap.key) || self.kb_keys.contains(&cap.key));
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
    /// Scripted runs: once the key script has finished, grab a frame and exit.
    fn screenshot_step(&mut self, ctx: &egui::Context) {
        let Some((path, frames)) = &mut self.screenshot else { return };
        *frames += 1;
        if *frames % 60 == 0 {
            eprintln!("script time {:.1}s / {:.1}s", self.script_time, self.end_time);
        }
        if self.script.is_empty() && self.script_time > self.end_time {
            ctx.send_viewport_cmd(egui::ViewportCommand::Screenshot(egui::UserData::default()));
        }
        let shot = ctx.input(|i| {
            i.events.iter().find_map(|e| match e {
                egui::Event::Screenshot { image, .. } => Some(image.clone()),
                _ => None,
            })
        });
        if let Some(image) = shot {
            save_png(path, &image);
            ctx.send_viewport_cmd(egui::ViewportCommand::Close);
        }
    }

    fn draw_lcd(&self, painter: &egui::Painter, to_screen: &dyn Fn(f32, f32) -> Pos2, scale: f32) {
        let lcd = self.machine.lcd();
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
        let scene = std::rc::Rc::new(hp48_vector::vectorize(&hp48_vector::Bitmap::from_rows(&lcd.pixels)));
        *cache = Some((lcd.pixels, scene.clone()));
        scene
    }
}

/// Stroke width of vectorised LCD lines, in LCD pixels.
const STROKE_WIDTH: f32 = 0.92;

fn draw_polyline(
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
    fonts.families.insert(bold(), vec!["dejavu-bold".into(), "dejavu".into()]);
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
    let mut rom_path = String::from("ROM/gxrom-r");
    let mut screenshot = None;
    let mut keys = Vec::new();
    let mut force_persist = false;
    let mut pixels = false;
    while let Some(a) = args.next() {
        match a.as_str() {
            "--persist" => force_persist = true,
            "--pixels" => pixels = true,
            "--rom" => rom_path = args.next().expect("--rom PATH"),
            "--screenshot" => screenshot = args.next(),
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
                    .collect()
            }
            other => panic!("unknown argument {other}"),
        }
    }
    let rom = std::fs::read(&rom_path).unwrap_or_else(|e| panic!("reading {rom_path}: {e}"));
    let options = eframe::NativeOptions {
        viewport: egui::ViewportBuilder::default()
            .with_title("HP 48GX")
            .with_inner_size([420.0, 784.0])
            .with_min_inner_size([200.0, 370.0]),
        ..Default::default()
    };
    eframe::run_native(
        "HP 48GX",
        options,
        Box::new(move |cc| {
            install_fonts(&cc.egui_ctx);
            let mut app = App::new(&rom, screenshot, keys, force_persist);
            if pixels {
                app.display = Display::Pixels;
            }
            Ok(Box::new(app))
        }),
    )
}
