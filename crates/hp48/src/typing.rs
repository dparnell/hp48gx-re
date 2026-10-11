//! Typing text into the command line as keystrokes.
//!
//! Letters go through alpha mode (lock for runs, left-shift for lower
//! case). Bracket keys insert a matched pair with the cursor between, so
//! a closing bracket is typed as ▶ to step past the one already there.
//!
//! Outside brackets the calculator is in immediate-entry mode, where an
//! operator key such as `+` performs ENTER and then the operation. The
//! effect is the same as typing it, so this is not avoided.

use crate::Key;

/// Key that types each letter in alpha mode, A..Z.
const ALPHA: [Key; 26] = [
    Key::A, Key::B, Key::C, Key::D, Key::E, Key::F,
    Key::Mth, Key::Prg, Key::Cst, Key::Var, Key::Up, Key::Nxt,
    Key::Quote, Key::Sto, Key::Eval, Key::Left, Key::Down, Key::Right,
    Key::Sin, Key::Cos, Key::Tan, Key::Sqrt, Key::Power, Key::Inv,
    Key::Neg, Key::Eex,
];

/// Opening characters that the editor inserts as a pair, with their closers.
fn pair(c: char) -> Option<(char, &'static [Key])> {
    Some(match c {
        '(' => (')', &[Key::LeftShift, Key::Div]),
        '[' => (']', &[Key::LeftShift, Key::Mul]),
        '«' => ('»', &[Key::LeftShift, Key::Minus]),
        '{' => ('}', &[Key::LeftShift, Key::Plus]),
        '\'' => ('\'', &[Key::Quote]),
        '"' => ('"', &[Key::RightShift, Key::Minus]),
        _ => return None,
    })
}

fn plain(c: char) -> Option<&'static [Key]> {
    Some(match c {
        '0' => &[Key::N0],
        '1' => &[Key::N1],
        '2' => &[Key::N2],
        '3' => &[Key::N3],
        '4' => &[Key::N4],
        '5' => &[Key::N5],
        '6' => &[Key::N6],
        '7' => &[Key::N7],
        '8' => &[Key::N8],
        '9' => &[Key::N9],
        '.' => &[Key::Dot],
        ' ' => &[Key::Space],
        '+' => &[Key::Plus],
        '-' => &[Key::Minus],
        '*' => &[Key::Mul],
        '/' => &[Key::Div],
        '^' => &[Key::Power],
        '\n' => &[Key::RightShift, Key::Dot],
        // Symbols typed in alpha mode, which inserts the bare character
        // (outside it, → and = come with surrounding spaces). Found by
        // typing every key; see examples/alphachars.rs.
        '=' => &[Key::Alpha, Key::LeftShift, Key::N0],
        ',' => &[Key::Alpha, Key::LeftShift, Key::Dot],
        'π' => &[Key::Alpha, Key::LeftShift, Key::Space],
        '#' => &[Key::Alpha, Key::RightShift, Key::Div],
        '_' => &[Key::Alpha, Key::RightShift, Key::Mul],
        '→' => &[Key::Alpha, Key::RightShift, Key::N0],
        '<' => &[Key::Alpha, Key::LeftShift, Key::N2],
        '>' => &[Key::Alpha, Key::RightShift, Key::N2],
        '≤' => &[Key::Alpha, Key::LeftShift, Key::N3],
        '≥' => &[Key::Alpha, Key::RightShift, Key::N3],
        '≠' => &[Key::Alpha, Key::RightShift, Key::N1],
        '∡' => &[Key::Alpha, Key::RightShift, Key::Space],
        '$' => &[Key::Alpha, Key::LeftShift, Key::N4],
        '°' => &[Key::Alpha, Key::RightShift, Key::N6],
        ':' => &[Key::Alpha, Key::RightShift, Key::Plus],
        _ => return None,
    })
}

/// Keystrokes that type `text` on the command line (not pressing ENTER).
/// Returns the first character that has no key sequence.
pub fn keystrokes(text: &str) -> Result<Vec<Key>, char> {
    let mut keys = Vec::new();
    let mut open: Vec<char> = Vec::new();
    let chars: Vec<char> = text.chars().collect();
    let mut i = 0;
    while i < chars.len() {
        let c = chars[i];
        if c.is_ascii_alphabetic() {
            let run = chars[i..].iter().take_while(|c| c.is_ascii_alphabetic()).count();
            // One letter: single-shot alpha. More: lock, type, unlock.
            keys.push(Key::Alpha);
            if run > 1 {
                keys.push(Key::Alpha);
            }
            for &l in &chars[i..i + run] {
                if l.is_ascii_lowercase() {
                    keys.push(Key::LeftShift);
                }
                keys.push(ALPHA[(l.to_ascii_uppercase() as u8 - b'A') as usize]);
            }
            if run > 1 {
                keys.push(Key::Alpha);
            }
            i += run;
            continue;
        }
        // A negative number outside an algebraic: in immediate mode `-`
        // would subtract, so type the digits and then +/-.
        let starts_token = i == 0 || matches!(chars[i - 1], ' ' | '\n' | '[' | '{' | '(' | '«');
        // A number outside an algebraic: type the exponent with EEX, and a
        // negative exponent's sign with +/- after its digits.
        if starts_token && !open.contains(&'\'') {
            if let Some(len) = number_len(&chars[i..]) {
                let num = &chars[i..i + len];
                let neg = num[0] == '-';
                let e = num.iter().position(|&d| d == 'E').unwrap_or(len);
                for &d in &num[usize::from(neg)..e] {
                    keys.extend_from_slice(plain(d).ok_or(d)?);
                }
                if neg {
                    keys.push(Key::Neg);
                }
                if e < len {
                    keys.push(Key::Eex);
                    let exp = &num[e + 1..];
                    let eneg = exp.first() == Some(&'-');
                    for &d in exp.iter().filter(|d| d.is_ascii_digit()) {
                        keys.extend_from_slice(plain(d).ok_or(d)?);
                    }
                    if eneg {
                        keys.push(Key::Neg);
                    }
                }
                i += len;
                continue;
            }
        }
        if open.last() == Some(&c) {
            open.pop();
            keys.push(Key::Right);
            if c == '»' {
                // the editor puts the closing » on a line of its own
                keys.push(Key::Right);
            }
        } else if let Some((close, seq)) = pair(c) {
            open.push(close);
            keys.extend_from_slice(seq);
        } else {
            keys.extend_from_slice(plain(c).ok_or(c)?);
        }
        i += 1;
    }
    Ok(keys)
}

/// Length of the number (`-1.5E-3`) at the start of `s`, if it is one
/// that `-` or `E` would otherwise break: a sign or an exponent.
fn number_len(s: &[char]) -> Option<usize> {
    let mut i = usize::from(s.first() == Some(&'-'));
    let mant = s[i..].iter().take_while(|d| d.is_ascii_digit() || **d == '.').count();
    if !s[i..i + mant].iter().any(char::is_ascii_digit) {
        return None;
    }
    i += mant;
    if s.get(i) == Some(&'E') {
        let sign = usize::from(s.get(i + 1) == Some(&'-'));
        let digits = s[i + 1 + sign..].iter().take_while(|d| d.is_ascii_digit()).count();
        if digits > 0 {
            i += 1 + sign + digits;
        }
    }
    let ends = !matches!(s.get(i), Some(c) if c.is_alphanumeric());
    (ends && i > mant).then_some(i)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn letters_use_alpha_and_brackets_step_over() {
        let k = keystrokes("'SIN(X)'").unwrap();
        assert_eq!(
            k,
            [
                Key::Quote,
                Key::Alpha, Key::Alpha, Key::Sin, Key::Cst, Key::Sto, Key::Alpha,
                Key::LeftShift, Key::Div,
                Key::Alpha, Key::Inv,
                Key::Right, Key::Right,
            ]
        );
        assert_eq!(keystrokes("a"), Ok(vec![Key::Alpha, Key::LeftShift, Key::A]));
        assert_eq!(keystrokes("@"), Err('@'));
        // a negative exponent: EEX, its digits, then +/-
        assert_eq!(
            keystrokes("-1E-2"),
            Ok(vec![Key::N1, Key::Neg, Key::Eex, Key::N2, Key::Neg])
        );
        let k = keystrokes("« 2 »").unwrap();
        assert_eq!(&k[k.len() - 2..], [Key::Right, Key::Right]);
    }
}
