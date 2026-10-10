//! Algebraic objects (`'SIN(X)+1'`) as evaluable expression trees.
//!
//! A symbolic object holds its expression in RPN order: operands, then the
//! command that combines them, e.g. `X xSIN %1 x+`. Commands are pointers to
//! the user-command entries in ROM; this table maps them to operators.

use crate::Object;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Op {
    Add,
    Sub,
    Mul,
    Div,
    Pow,
    Neg,
    Abs,
    Inv,
    Sqrt,
    Sq,
    Sin,
    Cos,
    Tan,
    Sinh,
    Cosh,
    Tanh,
    Asin,
    Acos,
    Atan,
    Exp,
    Ln,
    Log,
    Alog,
    Lnp1,
    Expm,
    Ip,
    Fp,
    Floor,
    Ceil,
    Sign,
    Max,
    Min,
    Mod,
    XRoot,
    Eq,
    Re,
    Im,
    Conj,
    Arg,
    Lt,
    Gt,
    Le,
    Ge,
    Same,
    Ne,
    And,
    Or,
    Xor,
    Not,
}

impl Op {
    /// The ROM user-command address for each operator (rev R, EDB).
    pub fn from_address(a: u32) -> Option<Op> {
        Some(match a {
            0x1AB67 => Op::Add,
            0x1AD09 => Op::Sub,
            0x1ADEE => Op::Mul,
            0x1AF05 => Op::Div,
            0x1B02D => Op::Pow,
            0x1A995 => Op::Neg,
            0x1AA1F => Op::Abs,
            0x1B278 => Op::Inv,
            0x1B374 => Op::Sqrt,
            0x1B426 => Op::Sq,
            0x1B4AC => Op::Sin,
            0x1B505 => Op::Cos,
            0x1B55E => Op::Tan,
            0x1B5B7 => Op::Sinh,
            0x1B606 => Op::Cosh,
            0x1B655 => Op::Tanh,
            0x1B6A4 => Op::Asin,
            0x1B72F => Op::Acos,
            0x1B79C => Op::Atan,
            0x1B905 => Op::Exp,
            0x1B94F => Op::Ln,
            0x1B9C6 => Op::Log,
            0x1BA3D => Op::Alog,
            0x1BA8C => Op::Lnp1,
            0x1BAC2 => Op::Expm,
            0x1BB6D => Op::Ip,
            0x1BBA3 => Op::Fp,
            0x1BBD9 => Op::Floor,
            0x1BC0F => Op::Ceil,
            0x1B32A => Op::Sign,
            0x1BC71 => Op::Max,
            0x1BCE3 => Op::Min,
            0x1BE4D => Op::Mod,
            0x1B1CA => Op::XRoot,
            0x1A8D8 => Op::Eq,
            0x1C7CA => Op::Re,
            0x1C819 => Op::Im,
            0x1AA6E => Op::Conj,
            0x1B2DB => Op::Arg,
            0x1EBBE => Op::Lt,
            0x1EC5D => Op::Gt,
            0x1ECFC => Op::Le,
            0x1ED9B => Op::Ge,
            0x1E972 => Op::Same,
            0x1EA9D => Op::Ne,
            0x1E783 => Op::And,
            0x1E809 => Op::Or,
            0x1E8F6 => Op::Xor,
            0x1E88F => Op::Not,
            _ => return None,
        })
    }

    pub fn arity(self) -> usize {
        match self {
            Op::Add
            | Op::Sub
            | Op::Mul
            | Op::Div
            | Op::Pow
            | Op::Max
            | Op::Min
            | Op::Mod
            | Op::XRoot
            | Op::Eq
            | Op::Lt
            | Op::Gt
            | Op::Le
            | Op::Ge
            | Op::Same
            | Op::Ne
            | Op::And
            | Op::Or
            | Op::Xor => 2,
            _ => 1,
        }
    }
}

/// The imaginary unit as a command.
const XI: u32 = 0x1AB45;

/// Constants that appear as commands (`xPI`, `xCONSTANTe`).
fn constant(a: u32) -> Option<f64> {
    match a {
        0x1AABD => Some(std::f64::consts::PI),
        0x1AB23 => Some(std::f64::consts::E),
        _ => None,
    }
}

#[derive(Clone, Debug, PartialEq)]
pub enum Expr {
    Num(f64),
    /// The imaginary unit (`xi`).
    I,
    Var(String),
    Apply(Op, Vec<Expr>),
}

#[derive(Debug, Clone, PartialEq)]
pub enum CompileError {
    NotSymbolic,
    Unsupported(String),
    StackUnderflow,
    Leftover(usize),
}

impl std::fmt::Display for CompileError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            CompileError::NotSymbolic => f.write_str("not an algebraic expression"),
            CompileError::Unsupported(what) => write!(f, "unsupported in plots: {what}"),
            CompileError::StackUnderflow => f.write_str("malformed expression"),
            CompileError::Leftover(n) => write!(f, "malformed expression ({n} operands left)"),
        }
    }
}

impl std::error::Error for CompileError {}

/// Compile a symbolic object (or a bare name/number) into an expression.
pub fn compile(obj: &Object) -> Result<Expr, CompileError> {
    match obj {
        Object::Symbolic(items) => compile_items(items),
        Object::Real(v) => Ok(Expr::Num(*v)),
        Object::Id(n) | Object::Lam(n) => Ok(Expr::Var(n.clone())),
        _ => Err(CompileError::NotSymbolic),
    }
}

fn compile_items(items: &[Object]) -> Result<Expr, CompileError> {
    let mut stack: Vec<Expr> = Vec::new();
    for it in items {
        match it {
            Object::Real(v) => stack.push(Expr::Num(*v)),
            Object::Bint(v) => stack.push(Expr::Num(f64::from(*v))),
            Object::Id(n) | Object::Lam(n) => stack.push(Expr::Var(n.clone())),
            Object::Symbolic(inner) => stack.push(compile_items(inner)?),
            Object::Builtin(XI) => stack.push(Expr::I),
            Object::Builtin(a) => {
                if let Some(c) = constant(*a) {
                    stack.push(Expr::Num(c));
                    continue;
                }
                let op = Op::from_address(*a).ok_or_else(|| CompileError::Unsupported(format!("command #{a:05X}")))?;
                let n = op.arity();
                if stack.len() < n {
                    return Err(CompileError::StackUnderflow);
                }
                let args = stack.split_off(stack.len() - n);
                stack.push(Expr::Apply(op, args));
            }
            other => return Err(CompileError::Unsupported(format!("{other:?}"))),
        }
    }
    match stack.len() {
        1 => Ok(stack.pop().unwrap()),
        0 => Err(CompileError::StackUnderflow),
        n => Err(CompileError::Leftover(n)),
    }
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Angle {
    Degrees,
    Radians,
    Grads,
}

impl Angle {
    fn to_rad(self, x: f64) -> f64 {
        match self {
            Angle::Degrees => x.to_radians(),
            Angle::Radians => x,
            Angle::Grads => x * std::f64::consts::PI / 200.0,
        }
    }
    fn rad_to(self, x: f64) -> f64 {
        match self {
            Angle::Degrees => x.to_degrees(),
            Angle::Radians => x,
            Angle::Grads => x * 200.0 / std::f64::consts::PI,
        }
    }
}

/// A complex value, for parametric plots (`x(t) + i*y(t)`).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct C {
    pub re: f64,
    pub im: f64,
}

impl C {
    pub const fn new(re: f64, im: f64) -> C {
        C { re, im }
    }
    const fn real(re: f64) -> C {
        C { re, im: 0.0 }
    }
    fn is_real(self) -> bool {
        self.im == 0.0
    }
    fn abs(self) -> f64 {
        self.re.hypot(self.im)
    }
    fn mul(self, o: C) -> C {
        C::new(self.re * o.re - self.im * o.im, self.re * o.im + self.im * o.re)
    }
    fn div(self, o: C) -> C {
        let d = o.re * o.re + o.im * o.im;
        C::new((self.re * o.re + self.im * o.im) / d, (self.im * o.re - self.re * o.im) / d)
    }
    fn exp(self) -> C {
        let m = self.re.exp();
        C::new(m * self.im.cos(), m * self.im.sin())
    }
    fn ln(self) -> C {
        C::new(self.abs().ln(), self.im.atan2(self.re))
    }
    fn sin(self) -> C {
        C::new(self.re.sin() * self.im.cosh(), self.re.cos() * self.im.sinh())
    }
    fn cos(self) -> C {
        C::new(self.re.cos() * self.im.cosh(), -self.re.sin() * self.im.sinh())
    }
    fn sinh(self) -> C {
        C::new(self.re.sinh() * self.im.cos(), self.re.cosh() * self.im.sin())
    }
    fn cosh(self) -> C {
        C::new(self.re.cosh() * self.im.cos(), self.re.sinh() * self.im.sin())
    }
}

fn truth(b: bool) -> f64 {
    if b {
        1.0
    } else {
        0.0
    }
}

/// Apply `op` to real arguments (`b` is NaN for unary operators).
fn apply_real(op: Op, a: f64, b: f64, angle: Angle) -> f64 {
    match op {
        Op::Add => a + b,
        Op::Sub => a - b,
        Op::Mul => a * b,
        Op::Div => a / b,
        Op::Pow => a.powf(b),
        Op::Neg => -a,
        Op::Abs => a.abs(),
        Op::Inv => 1.0 / a,
        Op::Sqrt => a.sqrt(),
        Op::Sq => a * a,
        Op::Sin => angle.to_rad(a).sin(),
        Op::Cos => angle.to_rad(a).cos(),
        Op::Tan => angle.to_rad(a).tan(),
        Op::Sinh => a.sinh(),
        Op::Cosh => a.cosh(),
        Op::Tanh => a.tanh(),
        Op::Asin => angle.rad_to(a.asin()),
        Op::Acos => angle.rad_to(a.acos()),
        Op::Atan => angle.rad_to(a.atan()),
        Op::Exp => a.exp(),
        Op::Ln => a.ln(),
        Op::Log => a.log10(),
        Op::Alog => 10f64.powf(a),
        Op::Lnp1 => a.ln_1p(),
        Op::Expm => a.exp_m1(),
        Op::Ip => a.trunc(),
        Op::Fp => a.fract(),
        Op::Floor => a.floor(),
        Op::Ceil => a.ceil(),
        Op::Sign => {
            if a == 0.0 {
                0.0
            } else {
                a.signum()
            }
        }
        Op::Max => a.max(b),
        Op::Min => a.min(b),
        Op::Mod => a - b * (a / b).floor(),
        Op::XRoot => {
            if a < 0.0 && b.fract() == 0.0 && (b as i64) % 2 != 0 {
                -(-a).powf(1.0 / b)
            } else {
                a.powf(1.0 / b)
            }
        }
        // An equation is plotted as its two sides; eval gives lhs.
        Op::Eq => a,
        Op::Re | Op::Conj => a,
        Op::Im => 0.0,
        Op::Arg => angle.rad_to(0f64.atan2(a)),
        Op::Lt => truth(a < b),
        Op::Gt => truth(a > b),
        Op::Le => truth(a <= b),
        Op::Ge => truth(a >= b),
        Op::Same => truth(a == b),
        Op::Ne => truth(a != b),
        Op::And => truth(a != 0.0 && b != 0.0),
        Op::Or => truth(a != 0.0 || b != 0.0),
        Op::Xor => truth((a != 0.0) != (b != 0.0)),
        Op::Not => truth(a == 0.0),
    }
}

impl Expr {
    /// Evaluate with `var` supplying variable values. Undefined (and
    /// non-real) results are NaN.
    pub fn eval(&self, var: &dyn Fn(&str) -> Option<f64>, angle: Angle) -> f64 {
        match self {
            Expr::Num(v) => *v,
            Expr::I => f64::NAN,
            Expr::Var(n) => var(n).unwrap_or(f64::NAN),
            Expr::Apply(op, args) => {
                let a = args[0].eval(var, angle);
                let b = args.get(1).map_or(f64::NAN, |b| b.eval(var, angle));
                apply_real(*op, a, b, angle)
            }
        }
    }

    /// Evaluate over the complex numbers. Operations on real values use the
    /// real rules (and the angle mode); complex arguments to trigonometric
    /// functions are in radians, as on the calculator. Operations with no
    /// complex form here give NaN for complex arguments.
    pub fn eval_complex(&self, var: &dyn Fn(&str) -> Option<f64>, angle: Angle) -> C {
        const NAN: C = C::new(f64::NAN, f64::NAN);
        match self {
            Expr::Num(v) => C::real(*v),
            Expr::I => C::new(0.0, 1.0),
            Expr::Var(n) => C::real(var(n).unwrap_or(f64::NAN)),
            Expr::Apply(op, args) => {
                let a = args[0].eval_complex(var, angle);
                let b = args.get(1).map_or(C::real(f64::NAN), |b| b.eval_complex(var, angle));
                if a.is_real() && (args.len() == 1 || b.is_real()) {
                    return C::real(apply_real(*op, a.re, b.re, angle));
                }
                match op {
                    Op::Add => C::new(a.re + b.re, a.im + b.im),
                    Op::Sub => C::new(a.re - b.re, a.im - b.im),
                    Op::Mul => a.mul(b),
                    Op::Div => a.div(b),
                    Op::Pow => b.mul(a.ln()).exp(),
                    Op::Neg => C::new(-a.re, -a.im),
                    Op::Abs => C::real(a.abs()),
                    Op::Inv => C::real(1.0).div(a),
                    Op::Sqrt => C::real(0.5).mul(a.ln()).exp(),
                    Op::Sq => a.mul(a),
                    Op::Sin => a.sin(),
                    Op::Cos => a.cos(),
                    Op::Tan => a.sin().div(a.cos()),
                    Op::Sinh => a.sinh(),
                    Op::Cosh => a.cosh(),
                    Op::Tanh => a.sinh().div(a.cosh()),
                    Op::Exp => a.exp(),
                    Op::Ln => a.ln(),
                    Op::Log => a.ln().div(C::real(std::f64::consts::LN_10)),
                    Op::Alog => a.mul(C::real(std::f64::consts::LN_10)).exp(),
                    Op::Re => C::real(a.re),
                    Op::Im => C::real(a.im),
                    Op::Conj => C::new(a.re, -a.im),
                    Op::Arg => C::real(angle.rad_to(a.im.atan2(a.re))),
                    Op::Same => C::real(truth(a == b)),
                    Op::Ne => C::real(truth(a != b)),
                    Op::Eq => a,
                    _ => NAN,
                }
            }
        }
    }

    /// For `lhs = rhs`, both sides; otherwise just the expression.
    pub fn sides(&self) -> Vec<&Expr> {
        match self {
            Expr::Apply(Op::Eq, args) => args.iter().collect(),
            e => vec![e],
        }
    }

    /// `lhs - rhs` for an equation (zero where it holds); otherwise the
    /// expression itself.
    pub fn as_zero(&self) -> Expr {
        match self {
            Expr::Apply(Op::Eq, args) => Expr::Apply(Op::Sub, args.clone()),
            e => e.clone(),
        }
    }
}

impl Op {
    /// Infix symbol and binding strength, for binary operators.
    fn infix(self) -> Option<(&'static str, u8)> {
        Some(match self {
            Op::Eq => ("=", 1),
            Op::Or => (" OR ", 2),
            Op::Xor => (" XOR ", 2),
            Op::And => (" AND ", 3),
            Op::Lt => ("<", 4),
            Op::Gt => (">", 4),
            Op::Le => ("\u{2264}", 4),
            Op::Ge => ("\u{2265}", 4),
            Op::Same => ("==", 4),
            Op::Ne => ("\u{2260}", 4),
            Op::Add => ("+", 5),
            Op::Sub => ("-", 5),
            Op::Mul => ("*", 6),
            Op::Div => ("/", 6),
            Op::Pow => ("^", 8),
            _ => return None,
        })
    }
}

impl Expr {
    /// Binding strength of the expression's top operator (atoms and
    /// function calls bind tightest).
    fn strength(&self) -> u8 {
        match self {
            Expr::Apply(Op::Neg, _) => 7,
            Expr::Apply(op, _) => op.infix().map_or(9, |(_, p)| p),
            Expr::Num(v) if *v < 0.0 => 7,
            _ => 9,
        }
    }

    fn write_operand(&self, f: &mut std::fmt::Formatter<'_>, paren: bool) -> std::fmt::Result {
        if paren {
            write!(f, "({self})")
        } else {
            write!(f, "{self}")
        }
    }
}

/// Algebraic notation with only the parentheses precedence requires.
impl std::fmt::Display for Expr {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Expr::Num(v) => write!(f, "{v}"),
            Expr::I => f.write_str("i"),
            Expr::Var(n) => f.write_str(n),
            Expr::Apply(op, args) => match (op.infix(), args.as_slice()) {
                (Some((sym, p)), [a, b]) => {
                    // Operators group left to right, so a right operand of
                    // equal strength needs parentheses unless the operator
                    // is associative.
                    let assoc = matches!(op, Op::Add | Op::Mul | Op::And | Op::Or);
                    a.write_operand(f, a.strength() < p)?;
                    f.write_str(sym)?;
                    b.write_operand(f, b.strength() < p || (b.strength() == p && !assoc))
                }
                (_, [a]) if *op == Op::Neg => {
                    f.write_str("-")?;
                    a.write_operand(f, a.strength() < 7)
                }
                _ => {
                    let name = match op {
                        Op::Sqrt => "\u{221A}".to_string(),
                        _ => format!("{op:?}").to_uppercase(),
                    };
                    write!(f, "{name}(")?;
                    for (i, a) in args.iter().enumerate() {
                        if i > 0 {
                            f.write_str(",")?;
                        }
                        write!(f, "{a}")?;
                    }
                    f.write_str(")")
                }
            },
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn var(n: &str) -> Expr {
        Expr::Var(n.into())
    }
    fn ap(op: Op, args: Vec<Expr>) -> Expr {
        Expr::Apply(op, args)
    }

    #[test]
    fn display_uses_minimal_parentheses() {
        let x = var("X");
        let one = Expr::Num(1.0);
        let e = ap(Op::Div, vec![ap(Op::Sub, vec![x.clone(), one.clone()]), ap(Op::Add, vec![x.clone(), one.clone()])]);
        assert_eq!(e.to_string(), "(X-1)/(X+1)");
        let e = ap(Op::Sub, vec![x.clone(), ap(Op::Sub, vec![var("Y"), var("Z")])]);
        assert_eq!(e.to_string(), "X-(Y-Z)");
        let e = ap(Op::Add, vec![ap(Op::Mul, vec![Expr::Num(2.0), ap(Op::Sin, vec![x.clone()])]), ap(Op::Mul, vec![Expr::I, x.clone()])]);
        assert_eq!(e.to_string(), "2*SIN(X)+i*X");
        assert_eq!(ap(Op::Neg, vec![ap(Op::Add, vec![x.clone(), one])]).to_string(), "-(X+1)");
    }

    #[test]
    fn complex_parametric_point() {
        // 2*SIN(3*T)+i*SIN(2*T) at T = pi/6 (radians): 2 + i*sqrt(3)/2.
        let t = var("T");
        let e = ap(
            Op::Add,
            vec![
                ap(Op::Mul, vec![Expr::Num(2.0), ap(Op::Sin, vec![ap(Op::Mul, vec![Expr::Num(3.0), t.clone()])])]),
                ap(Op::Mul, vec![Expr::I, ap(Op::Sin, vec![ap(Op::Mul, vec![Expr::Num(2.0), t])])]),
            ],
        );
        let z = e.eval_complex(&|n| (n == "T").then_some(std::f64::consts::FRAC_PI_6), Angle::Radians);
        assert!((z.re - 2.0).abs() < 1e-12 && (z.im - 3f64.sqrt() / 2.0).abs() < 1e-12, "{z:?}");
        // A complex value has no real evaluation.
        assert!(e.eval(&|_| Some(0.5), Angle::Radians).is_nan());
    }

    #[test]
    fn comparisons_give_truth_values() {
        let e = ap(Op::And, vec![ap(Op::Lt, vec![var("X"), var("Y")]), ap(Op::Not, vec![ap(Op::Same, vec![var("X"), Expr::Num(2.0)])])]);
        let at = |x: f64, y: f64| e.eval(&|n| Some(if n == "X" { x } else { y }), Angle::Radians);
        assert_eq!((at(1.0, 3.0), at(2.0, 3.0), at(4.0, 3.0)), (1.0, 0.0, 0.0));
    }
}
