//! A small 1-bit bitmap with the region operations the vectoriser needs.

use crate::Rect;

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Bitmap {
    pub w: usize,
    pub h: usize,
    px: Vec<bool>,
}

pub struct Component {
    pub pixels: Vec<(usize, usize)>,
    /// (x0, y0, x1, y1), inclusive.
    pub bbox: (usize, usize, usize, usize),
}

impl Bitmap {
    pub fn new(w: usize, h: usize) -> Self {
        Bitmap { w, h, px: vec![false; w * h] }
    }

    pub fn from_rows<R: AsRef<[bool]>>(rows: &[R]) -> Self {
        let h = rows.len();
        let w = rows.first().map_or(0, |r| r.as_ref().len());
        let mut b = Bitmap::new(w, h);
        for (y, r) in rows.iter().enumerate() {
            for (x, &p) in r.as_ref().iter().enumerate() {
                b.set(x, y, p);
            }
        }
        b
    }

    #[inline]
    pub fn get(&self, x: usize, y: usize) -> bool {
        x < self.w && y < self.h && self.px[y * self.w + x]
    }

    /// Like `get`, but out-of-range coordinates (including negative) are blank.
    #[inline]
    pub fn at(&self, x: isize, y: isize) -> bool {
        x >= 0 && y >= 0 && self.get(x as usize, y as usize)
    }

    #[inline]
    pub fn set(&mut self, x: usize, y: usize, v: bool) {
        if x < self.w && y < self.h {
            self.px[y * self.w + x] = v;
        }
    }

    pub fn count(&self) -> usize {
        self.px.iter().filter(|&&p| p).count()
    }

    /// 8-connected components of set pixels.
    pub fn components(&self) -> Vec<Component> {
        let mut seen = vec![false; self.px.len()];
        let mut out = Vec::new();
        for start in 0..self.px.len() {
            if !self.px[start] || seen[start] {
                continue;
            }
            seen[start] = true;
            let mut stack = vec![start];
            let mut pixels = Vec::new();
            let (mut x0, mut y0, mut x1, mut y1) = (usize::MAX, usize::MAX, 0, 0);
            while let Some(i) = stack.pop() {
                let (x, y) = (i % self.w, i / self.w);
                pixels.push((x, y));
                x0 = x0.min(x);
                y0 = y0.min(y);
                x1 = x1.max(x);
                y1 = y1.max(y);
                for dy in -1isize..=1 {
                    for dx in -1isize..=1 {
                        let (nx, ny) = (x as isize + dx, y as isize + dy);
                        if self.at(nx, ny) {
                            let j = ny as usize * self.w + nx as usize;
                            if !seen[j] {
                                seen[j] = true;
                                stack.push(j);
                            }
                        }
                    }
                }
            }
            out.push(Component { pixels, bbox: (x0, y0, x1, y1) });
        }
        out
    }

    /// Cover the set pixels with rectangles: horizontal runs, merged
    /// downwards while they line up exactly.
    pub fn rectangles(&self) -> Vec<Rect> {
        let mut open: Vec<(usize, usize, usize, usize)> = Vec::new(); // x0, x1, y0, h
        let mut out = Vec::new();
        for y in 0..=self.h {
            let mut runs = Vec::new();
            if y < self.h {
                let mut x = 0;
                while x < self.w {
                    if self.get(x, y) {
                        let s = x;
                        while x < self.w && self.get(x, y) {
                            x += 1;
                        }
                        runs.push((s, x));
                    } else {
                        x += 1;
                    }
                }
            }
            let mut next = Vec::new();
            for &(s, e) in &runs {
                if let Some(pos) = open.iter().position(|o| o.0 == s && o.1 == e) {
                    let mut o = open.swap_remove(pos);
                    o.3 += 1;
                    next.push(o);
                } else {
                    next.push((s, e, y, 1));
                }
            }
            for o in open {
                out.push(Rect { x: o.0 as f32, y: o.2 as f32, w: (o.1 - o.0) as f32, h: o.3 as f32 });
            }
            open = next;
        }
        out
    }

    /// Blank pixels inside the box (x0..=x1, y0..=y1) with set pixels to
    /// their left and right in the same row, and above or below in the same
    /// column. Unlike a flood fill this keeps a light letter whose stroke
    /// touches the edge of an inverted bar (the tail of a q).
    pub fn surrounded_holes(&self, x0: usize, y0: usize, x1: usize, y1: usize) -> Bitmap {
        let mut holes = Bitmap::new(self.w, self.h);
        for y in y0..=y1 {
            for x in x0..=x1 {
                if self.get(x, y) {
                    continue;
                }
                let left = (x0..x).any(|i| self.get(i, y));
                let right = (x + 1..=x1).any(|i| self.get(i, y));
                let up = (y0..y).any(|j| self.get(x, j));
                let down = (y + 1..=y1).any(|j| self.get(x, j));
                if left && right && (up || down) {
                    holes.set(x, y, true);
                }
            }
        }
        holes
    }

    /// Blank pixels inside the box (x0..=x1, y0..=y1) that are not
    /// 4-connected to the box border through blank pixels.
    pub fn enclosed_holes(&self, x0: usize, y0: usize, x1: usize, y1: usize) -> Bitmap {
        let (w, h) = (x1 - x0 + 1, y1 - y0 + 1);
        let mut outside = vec![false; w * h];
        let mut stack = Vec::new();
        for x in 0..w {
            stack.push((x, 0));
            stack.push((x, h - 1));
        }
        for y in 0..h {
            stack.push((0, y));
            stack.push((w - 1, y));
        }
        while let Some((x, y)) = stack.pop() {
            let i = y * w + x;
            if outside[i] || self.get(x0 + x, y0 + y) {
                continue;
            }
            outside[i] = true;
            if x > 0 {
                stack.push((x - 1, y));
            }
            if x + 1 < w {
                stack.push((x + 1, y));
            }
            if y > 0 {
                stack.push((x, y - 1));
            }
            if y + 1 < h {
                stack.push((x, y + 1));
            }
        }
        let mut holes = Bitmap::new(self.w, self.h);
        for y in 0..h {
            for x in 0..w {
                if !outside[y * w + x] && !self.get(x0 + x, y0 + y) {
                    holes.set(x0 + x, y0 + y, true);
                }
            }
        }
        holes
    }
}
