use core::cmp::{max, min};
use core::num::traits::Sqrt;

const SCALE: u256 = 10_000;

#[derive(Drop, Copy)]
struct SVNN {
    T: u256,
    I: u256,
    F: u256
}

pub trait SVNNTrait {
    fn new(T: u256, I: u256, F: u256) -> SVNN;
    fn getT(self: @SVNN) -> u256;
    fn getI(self: @SVNN) -> u256;
    fn getF(self: @SVNN) -> u256;
}

impl SVNNImpl of SVNNTrait {
    fn getT(self: @SVNN) -> u256{
        *self.T
    }
    fn getI(self: @SVNN) -> u256{
        *self.I
    }
    fn getF(self: @SVNN) -> u256{
        *self.F
    }
    
    fn new(T: u256, I: u256, F: u256) -> SVNN {
        assert!(T >= 0 && T <= SCALE,
        "value for attribute T must be equal or greater than 0 and less or equal than 1");
        assert!(I >= 0 && I <= SCALE,
        "value for attribute I must be equal or greater than 0 and less or equal than 1");
        assert!(F >= 0 && F <= SCALE,
        "value for attribute F must be equal or greater than 0 and less or equal than 1");

        SVNN { T, I, F}
    }
}

pub fn isContained(x: SVNN, y: SVNN) -> bool {
    (x.T <= y.T && x.I >= y.I && x.F >= y.F)
}

pub fn isEqual(x: SVNN, y: SVNN) -> bool {
    isContained(x, y) && isContained(y, x)
}

pub fn union(x: SVNN, y: SVNN) -> SVNN {
    SVNNTrait::new(
        max(x.T, y.T),
        max(x.I, y.I),
        min(x.F, y.F)
    )
}

pub fn intersection(x: SVNN, y: SVNN) -> SVNN {
    SVNNTrait::new(
        min(x.T, y.T),
        min(x.I, y.I),
        max(x.F, y.F)
    )
}

pub fn difference(x: SVNN, y: SVNN) -> SVNN {
    SVNNTrait::new(
        min(x.T, y.F),
        min(x.I, SCALE - y.I),
        max(x.F, y.T)
    )
}

pub fn add(x: SVNN, y: SVNN) -> SVNN {
    SVNNTrait::new(
       (x.T + y.T) - ((x.T * y.T) / SCALE),
       (x.I * y.I) / SCALE,
       (x.F * y.F) / SCALE
    )
}

pub fn multiply(x: SVNN, y: SVNN) -> SVNN {
    SVNNTrait::new(
        (x.T * y.T) / SCALE,
        (x.I + y.I) - ((x.I * y.I) / SCALE),
        (x.F + y.F) - ((x.F * y.F) / SCALE)
    )
}
    
pub fn complement(x: SVNN) -> SVNN {
    SVNNTrait::new(
        x.F,
        SCALE - x.I,
        x.T
    )
}
pub fn accuracy(x: SVNN) -> u256 {
    x.T - x.I
}

pub fn score(x: SVNN) -> u256 {
    (2 * SCALE + (x.T - x.I - x.F)) / 3
}

pub fn deneutrosophy(x: SVNN) -> u256 {
    let t: u256 = (SCALE - x.T) * (SCALE - x.T);
    let i: u256 = x.I * x.I;
    let f: u256 = x.F * x.F;
    SCALE - (SCALE * ((t + i + f) / (3 * SCALE))).sqrt().into()
}