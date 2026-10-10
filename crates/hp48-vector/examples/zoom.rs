//! Render a crop of an LCD dump, pixels and vectors side by side:
//! zoom DUMP OUT.png SCALE X0 Y0 X1 Y1
fn main() {
    let a: Vec<String> = std::env::args().collect();
    let rows: Vec<Vec<bool>> = std::fs::read_to_string(&a[1]).unwrap().lines()
        .map(|l| l.chars().map(|c| c == '1').collect()).collect();
    let scale: f32 = a[3].parse().unwrap();
    let n = |i: usize| a[i].parse::<usize>().unwrap();
    let (x0, y0, x1, y1) = (n(4), n(5), n(6), n(7));
    let crop: Vec<Vec<bool>> = rows[y0..y1].iter().map(|r| r[x0..x1].to_vec()).collect();
    let bmp = hp48_vector::Bitmap::from_rows(&crop);
    let scene = hp48_vector::vectorize(&hp48_vector::Bitmap::from_rows(&rows));
    // Vector render of the whole frame, then crop.
    let (w, _h, full) = hp48_vector::render_rgb(&scene, rows[0].len(), rows.len(), scale, 0.92, [188, 198, 169], [30, 36, 28]);
    let (cw, ch) = (((x1 - x0) as f32 * scale) as usize, ((y1 - y0) as f32 * scale) as usize);
    let mut out = vec![0u8; cw * 2 * ch * 3];
    for y in 0..ch {
        for x in 0..cw {
            let on = bmp.get((x as f32 / scale) as usize, (y as f32 / scale) as usize);
            let px: [u8; 3] = if on { [30, 36, 28] } else { [188, 198, 169] };
            out[(y * cw * 2 + x) * 3..][..3].copy_from_slice(&px);
            let sx = (x0 as f32 * scale) as usize + x;
            let sy = (y0 as f32 * scale) as usize + y;
            out[(y * cw * 2 + cw + x) * 3..][..3].copy_from_slice(&full[(sy * w + sx) * 3..][..3]);
        }
    }
    let file = std::fs::File::create(&a[2]).unwrap();
    let mut e = png::Encoder::new(std::io::BufWriter::new(file), (cw * 2) as u32, ch as u32);
    e.set_color(png::ColorType::Rgb);
    e.set_depth(png::BitDepth::Eight);
    e.write_header().unwrap().write_image_data(&out).unwrap();
}
