//! The desktop layout's side panel: the stack as text, the menu keys as
//! buttons, and a command line edited with the computer's keyboard.
//!
//! Everything shown is read from calculator memory (`hp48_rpl`), and every
//! action is sent as keystrokes, so the ROM does the work exactly as on the
//! calculator.

use eframe::egui::{self, Align, Color32, CornerRadius, FontId, Layout, RichText, Sense, Stroke, Vec2};
use hp48::{Key, Machine, LCD_WIDTH};
use hp48_rpl::plot::system_flag;
use hp48_rpl::show::{Format, Names, Writer};
use hp48_rpl::{decode, stack, Memory};
use std::time::Instant;

/// What the panel asks the calculator to do.
pub enum Action {
    /// Type this text on the calculator's command line, then press ENTER.
    Enter(String),
    Key(Key),
}

const MENU_KEYS: [Key; 6] = [Key::A, Key::B, Key::C, Key::D, Key::E, Key::F];
/// Most levels shown; deeper levels are counted only.
const MAX_LEVELS: usize = 500;

pub const PANEL_BG: Color32 = Color32::from_rgb(0x1E, 0x1F, 0x24);
const ROW_BG: Color32 = Color32::from_rgb(0x26, 0x27, 0x2D);
const LEVEL: Color32 = Color32::from_rgb(0x8A, 0x8D, 0x96);
const TEXT: Color32 = Color32::from_rgb(0xEC, 0xEC, 0xEE);
const DIM: Color32 = Color32::from_rgb(0xA6, 0xA9, 0xB2);

struct Ram<'a>(&'a Machine);

impl Memory for Ram<'_> {
    fn nib(&self, a: u32) -> u8 {
        self.0.hw.peek(a)
    }
}

struct Rom<'a>(&'a Machine);

impl Memory for Rom<'_> {
    fn nib(&self, a: u32) -> u8 {
        self.0.hw.rom[(a & 0xF_FFFF) as usize]
    }
}

/// The stack as text, rebuilt when the stack or the display settings change.
#[derive(Default)]
struct Shown {
    key: Vec<u32>,
    format: Option<Format>,
    /// Level 1 first.
    levels: Vec<String>,
    depth: usize,
    when: Option<Instant>,
}

#[derive(Default)]
pub struct Desk {
    names: Option<Names>,
    /// The library table the names were read from.
    romptab: Vec<u8>,
    shown: Shown,
    line: String,
    history: Vec<String>,
    /// Position while recalling history with the arrow keys.
    recall: Option<usize>,
    /// The command line had keyboard focus last frame: keys belong to it.
    pub focused: bool,
    /// Height of the stack rows last frame.
    rows_height: f32,
}

impl Desk {
    fn refresh(&mut self, m: &Machine) {
        let ram = Ram(m);
        // The library table (ROMPTAB) is built at boot and changes when
        // libraries are attached: read the names again when it changes.
        const ROMPTAB: u32 = 0x809A3;
        let count = ram.value(ROMPTAB, 3) as u32;
        let table: Vec<u8> = (0..3 + 16 * count.min(256)).map(|i| ram.nib(ROMPTAB + i)).collect();
        if table != self.romptab {
            self.names = (count != 0).then(|| Names::read(&ram, &Rom(m)));
            self.romptab = table;
            self.shown.when = None;
        }
        let Some(names) = &self.names else { return };
        // While the calculator is busy, its stack holds work in progress:
        // keep showing the last stack.
        if busy(m) && self.shown.when.is_some() {
            return;
        }
        let slots = stack(&ram);
        let format = Format::from_flags(&ram);
        // Objects do not change in place, but garbage collection can move
        // them, so also refresh now and then.
        let stale = !matches!(self.shown.when, Some(t) if t.elapsed().as_millis() <= 500);
        if !stale && slots == self.shown.key && Some(format) == self.shown.format {
            return;
        }
        let w = Writer { mem: &ram, names, format };
        self.shown.levels = slots
            .iter()
            .take(MAX_LEVELS)
            .map(|&a| match decode(&ram, a) {
                Ok(o) => w.show(&o),
                Err(e) => format!("({e})"),
            })
            .collect();
        self.shown.depth = slots.len();
        self.shown.key = slots;
        self.shown.format = Some(format);
        self.shown.when = Some(Instant::now());
    }

    /// Draw the panel in `ui`; returns what to send to the calculator.
    pub fn ui(&mut self, ui: &mut egui::Ui, m: &Machine) -> Vec<Action> {
        self.refresh(m);
        let mut actions = Vec::new();
        ui.style_mut().visuals.override_text_color = Some(TEXT);
        self.status(ui, m);
        ui.add_space(6.0);

        let menu_h = 34.0;
        let line_h = 40.0;
        let stack_h = (ui.available_height() - menu_h - line_h - 24.0).max(60.0);
        self.stack_view(ui, stack_h);
        ui.add_space(8.0);
        menu_row(ui, m, menu_h, &mut actions);
        ui.add_space(8.0);
        self.command_line(ui, line_h, &mut actions);
        actions
    }

    /// Modes, as the calculator's status line shows them.
    fn status(&self, ui: &mut egui::Ui, m: &Machine) {
        let ram = Ram(m);
        let f = |n| system_flag(&ram, n);
        let angle = match (f(17), f(18)) {
            (true, _) => "RAD",
            (false, true) => "GRAD",
            (false, false) => "DEG",
        };
        let coords = if f(16) { "  POLAR" } else { "" };
        let format = self.shown.format.unwrap_or_default();
        let mode = match format.mode {
            hp48_rpl::show::Mode::Std => "STD".to_string(),
            hp48_rpl::show::Mode::Fix(n) => format!("FIX {n}"),
            hp48_rpl::show::Mode::Sci(n) => format!("SCI {n}"),
            hp48_rpl::show::Mode::Eng(n) => format!("ENG {n}"),
        };
        let base = match format.base {
            hp48_rpl::show::Base::Dec => "DEC",
            hp48_rpl::show::Base::Bin => "BIN",
            hp48_rpl::show::Base::Oct => "OCT",
            hp48_rpl::show::Base::Hex => "HEX",
        };
        ui.horizontal(|ui| {
            ui.label(RichText::new(format!("{angle}{coords}   {mode}   {base}")).color(DIM).size(13.0));
            ui.with_layout(Layout::right_to_left(Align::Center), |ui| {
                let n = self.shown.depth;
                let text = if busy(m) {
                    "busy".to_string()
                } else if n == 1 {
                    "1 level".to_string()
                } else {
                    format!("{n} levels")
                };
                ui.label(RichText::new(text).color(DIM).size(13.0));
            });
        });
    }

    /// Level 1 at the bottom, as on the calculator; scrolls up to deeper levels.
    fn stack_view(&mut self, ui: &mut egui::Ui, height: f32) {
        let font = FontId::proportional(17.0);
        egui::Frame::new().fill(ROW_BG).corner_radius(CornerRadius::same(6)).inner_margin(8.0).show(ui, |ui| {
            ui.set_min_height(height - 16.0);
            ui.set_max_height(height - 16.0);
            let out = egui::ScrollArea::vertical().stick_to_bottom(true).auto_shrink([false, false]).show(ui, |ui| {
                // Deepest level first; padding above keeps level 1 at the
                // bottom while the stack is shorter than the view.
                ui.add_space((ui.available_height() - self.rows_height).max(0.0));
                let top = ui.cursor().top();
                if self.shown.depth > self.shown.levels.len() {
                    let more = self.shown.depth - self.shown.levels.len();
                    ui.label(RichText::new(format!("{more} more levels")).color(LEVEL));
                }
                if self.shown.levels.is_empty() {
                    ui.label(RichText::new("Empty stack").color(LEVEL).size(15.0));
                }
                for (i, text) in self.shown.levels.iter().enumerate().rev() {
                    level_row(ui, i + 1, text, &font);
                }
                ui.cursor().top() - top
            });
            self.rows_height = out.inner;
        });
    }

    fn command_line(&mut self, ui: &mut egui::Ui, height: f32, actions: &mut Vec<Action>) {
        let id = ui.id().with("command-line");
        let (enter, up, down, escape) = ui.input(|i| {
            (
                i.key_pressed(egui::Key::Enter),
                i.key_pressed(egui::Key::ArrowUp),
                i.key_pressed(egui::Key::ArrowDown),
                i.key_pressed(egui::Key::Escape),
            )
        });
        let edit = egui::TextEdit::singleline(&mut self.line)
            .id(id)
            .font(FontId::monospace(16.0))
            .text_color(TEXT)
            .background_color(ROW_BG)
            .margin(Vec2::new(10.0, 4.0))
            .hint_text("Type RPL here and press Enter.  Esc returns the keyboard to the calculator.")
            .desired_width(f32::INFINITY)
            .min_size(Vec2::new(0.0, height))
            .vertical_align(Align::Center)
            .return_key(None);
        let resp = ui.add(edit);
        let focused = resp.has_focus();
        if focused && enter {
            let text = std::mem::take(&mut self.line);
            if text.trim().is_empty() {
                actions.push(Action::Key(Key::Enter));
            } else {
                if self.history.last() != Some(&text) {
                    self.history.push(text.clone());
                }
                actions.push(Action::Enter(text));
            }
            self.recall = None;
        } else if focused && (up || down) && !self.history.is_empty() {
            let last = self.history.len() - 1;
            let pos = match (self.recall, up) {
                (None, true) => Some(last),
                (None, false) => None,
                (Some(p), true) => Some(p.saturating_sub(1)),
                (Some(p), false) if p < last => Some(p + 1),
                (Some(_), false) => None,
            };
            self.recall = pos;
            self.line = pos.map(|p| self.history[p].clone()).unwrap_or_default();
            if let Some(mut state) = egui::TextEdit::load_state(ui.ctx(), id) {
                let end = egui::text::CCursor::new(self.line.chars().count());
                state.cursor.set_char_range(Some(egui::text::CCursorRange::one(end)));
                state.store(ui.ctx(), id);
            }
        } else if focused && escape {
            resp.surrender_focus();
        }
        self.focused = resp.has_focus();
    }
}

/// The BUSY annunciator is lit.
fn busy(m: &Machine) -> bool {
    let a = m.lcd().annunciators;
    a & 0x80 != 0 && a & 0x10 != 0
}

fn level_row(ui: &mut egui::Ui, level: usize, text: &str, font: &FontId) {
    ui.horizontal_top(|ui| {
        let (r, _) = ui.allocate_exact_size(Vec2::new(44.0, font.size * 1.25), Sense::hover());
        ui.painter().text(r.left_top(), egui::Align2::LEFT_TOP, format!("{level}:"), font.clone(), LEVEL);
        let label = egui::Label::new(RichText::new(text).font(font.clone())).wrap().sense(Sense::click());
        let resp = ui.add(label);
        resp.context_menu(|ui| {
            if ui.button("Copy").clicked() {
                ui.ctx().copy_text(text.to_string());
                ui.close();
            }
        });
    });
}

/// The six menu labels from the bottom of the LCD, as buttons that press
/// the menu keys. Labels are 21 pixels wide, every 22 pixels.
fn menu_row(ui: &mut egui::Ui, m: &Machine, height: f32, actions: &mut Vec<Action>) {
    let lcd = m.lcd();
    let width = ui.available_width();
    let gap = 6.0;
    let w = (width - 5.0 * gap) / 6.0;
    let (rect, _) = ui.allocate_exact_size(Vec2::new(width, height), Sense::hover());
    for (i, key) in MENU_KEYS.into_iter().enumerate() {
        let r = egui::Rect::from_min_size(rect.min + Vec2::new(i as f32 * (w + gap), 0.0), Vec2::new(w, height));
        let resp = ui.interact(r, ui.id().with(("menu", i)), Sense::click());
        let bg = if resp.is_pointer_button_down_on() {
            Color32::from_rgb(0xA8, 0xB2, 0x95)
        } else if resp.hovered() {
            Color32::from_rgb(0xC8, 0xD2, 0xB5)
        } else {
            Color32::from_rgb(0xBC, 0xC6, 0xA9)
        };
        let painter = ui.painter();
        painter.rect_filled(r, CornerRadius::same(5), bg);
        painter.rect_stroke(r, CornerRadius::same(5), Stroke::new(1.0, Color32::from_black_alpha(80)), egui::StrokeKind::Inside);
        // the label's pixels, scaled to fit
        let x0 = 22 * i;
        let cols = 21.min(LCD_WIDTH - x0);
        let px = ((r.height() - 8.0) / 8.0).min((r.width() - 8.0) / cols as f32).max(1.0);
        let origin = r.center() - Vec2::new(cols as f32 * px, 8.0 * px) / 2.0;
        if lcd.on {
            for y in 0..8 {
                for x in 0..cols {
                    if lcd.pixels[56 + y][x0 + x] {
                        let p = origin + Vec2::new(x as f32 * px, y as f32 * px);
                        painter.rect_filled(
                            egui::Rect::from_min_size(p, Vec2::splat(px)),
                            CornerRadius::ZERO,
                            Color32::from_rgb(0x1E, 0x24, 0x1C),
                        );
                    }
                }
            }
        }
        if resp.clicked() {
            actions.push(Action::Key(key));
        }
    }
}
