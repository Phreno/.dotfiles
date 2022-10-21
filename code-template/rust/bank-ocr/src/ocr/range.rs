use std::ops::Range;

use super::DIGIT_WIDTH;

pub fn get_range_from_position(position: usize) -> Range<usize> {
    let range = Range {
        start: position,
        end: position + DIGIT_WIDTH,
    };
    range
}
