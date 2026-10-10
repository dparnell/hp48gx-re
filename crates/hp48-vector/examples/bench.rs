//! Time vectorize() on an LCD dump (text file of 0/1 rows).
fn main() {
    let path = std::env::args().nth(1).expect("dump file");
    let rows: Vec<Vec<bool>> = std::fs::read_to_string(path)
        .unwrap()
        .lines()
        .map(|l| l.chars().map(|c| c == '1').collect())
        .collect();
    let bmp = hp48_vector::Bitmap::from_rows(&rows);
    let t = std::time::Instant::now();
    let n = 50;
    let mut scene = hp48_vector::vectorize(&bmp);
    for _ in 1..n {
        scene = hp48_vector::vectorize(&bmp);
    }
    let per = t.elapsed() / n;
    let pts: usize = scene.dark.iter().chain(scene.light.iter()).map(|p| p.points.len()).sum();
    println!(
        "vectorize: {per:?} per frame; {} fills, {} dark, {} light polylines, {pts} points",
        scene.fills.len(),
        scene.dark.len(),
        scene.light.len()
    );
}
