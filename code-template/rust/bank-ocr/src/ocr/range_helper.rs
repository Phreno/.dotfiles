use std::ops::Range;

pub fn get_range_from_position(position: usize) -> Range<usize> {
    let range = Range {
        start: position,
        end: position + 3,
    };
    range
}
