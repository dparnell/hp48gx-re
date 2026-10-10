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
            _ => return None,
        })
    }

    pub fn arity(self) -> usize {
        match self {
            Op::Add | Op::Sub | Op::Mul | Op::Div | Op::Pow | Op::Max | Op::Min | Op::Mod | Op::XRoot | Op::Eq => 2,
            _ => 1,
        }
    }
}

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
    fn from_rad(self, x: f64) -> f64 {
        match self {
            Angle::Degrees => x.to_degrees(),
            Angle::Radians => x,
            Angle::Grads => x * 200.0 / std::f64::consts::PI,
        }
    }
}

impl Expr {
    /// Evaluate with `var` supplying variable values. Undefined results are NaN.
    pub fn eval(&self, var: &dyn Fn(&str) -> Option<f64>, angle: Angle) -> f64 {
        match self {
            Expr::Num(v) => *v,
            Expr::Var(n) => var(n).unwrap_or(f64::NAN),
            Expr::Apply(op, args) => {
                let a = args[0].eval(var, angle);
                let b = || args[1].eval(var, angle);
                match op {
                    Op::Add => a + b(),
                    Op::Sub => a - b(),
                    Op::Mul => a * b(),
                    Op::Div => a / b(),
                    Op::Pow => a.powf(b()),
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
                    Op::Asin => angle.from_rad(a.asin()),
                    Op::Acos => angle.from_rad(a.acos()),
                    Op::Atan => angle.from_rad(a.atan()),
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
                    Op::Max => a.max(b()),
                    Op::Min => a.min(b()),
                    Op::Mod => {
                        let m = b();
                        a - m * (a / m).floor()
                    }
                    Op::XRoot => {
                        let n = b();
                        if a < 0.0 && n.fract() == 0.0 && (n as i64) % 2 != 0 {
                            -(-a).powf(1.0 / n)
                        } else {
                            a.powf(1.0 / n)
                        }
                    }
                    // An equation is plotted as its two sides; eval gives lhs.
                    Op::Eq => a,
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
}

impl std::fmt::Display for Expr {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Expr::Num(v) => write!(f, "{v}"),
            Expr::Var(n) => f.write_str(n),
            Expr::Apply(op, args) => {
                let sym = match op {
                    Op::Add => Some("+"),
                    Op::Sub => Some("-"),
                    Op::Mul => Some("*"),
                    Op::Div => Some("/"),
                    Op::Pow => Some("^"),
                    Op::Eq => Some("="),
                    _ => None,
                };
                match (sym, args.as_slice()) {
                    (Some(s), [a, b]) => write!(f, "({a}{s}{b})"),
                    _ => {
                        write!(f, "{}(", format!("{op:?}").to_uppercase())?;
                        for (i, a) in args.iter().enumerate() {
                            if i > 0 {
                                f.write_str(",")?;
                            }
                            write!(f, "{a}")?;
                        }
                        f.write_str(")")
                    }
                }
            }
        }
    }
}
