//! Print scene items touching a pixel region: probe DUMP X0 Y0 X1 Y1
fn main() {
    let a: Vec<String> = std::env::args().collect();
    let rows: Vec<Vec<bool>> = std::fs::read_to_string(&a[1]).unwrap().lines()
        .map(|l| l.chars().map(|c| c == '1').collect()).collect();
    let n = |i: usize| a[i].parse::<f32>().unwrap();
    let (x0, y0, x1, y1) = (n(2), n(3), n(4), n(5));
    let s = hp48_vector::vectorize(&hp48_vector::Bitmap::from_rows(&rows));
    let inside = |p: &[f32; 2]| p[0] >= x0 && p[0] <= x1 && p[1] >= y0 && p[1] <= y1;
    for r in &s.fills {
        if r.x <= x1 && r.x + r.w >= x0 && r.y <= y1 && r.y + r.h >= y0 { println!("fill {r:?}"); }
    }
    for (name, v) in [("dark", &s.dark), ("light", &s.light)] {
        for p in v.iter() {
            if p.points.iter().any(&inside) { println!("{name} {:?}", p.points); }
        }
    }
}
