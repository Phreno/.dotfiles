use std::ops::Range;

use super::DIGIT_WIDTH;

pub fn get_range_from_position(position: usize) -> Range<usize> {
    Range {
        start: position,
        end: position + DIGIT_WIDTH,
    }
}
