use super::*;
mod range;
pub struct OcrIterator {
    pub ocr: Ocr,
    pub position: usize,
}

fn get_range(position: usize) -> std::ops::Range<usize> {
    range::get_range_from_position(position)
}

fn map_to_number(splitted_digit: Vec<String>) -> String {
    mapper::map_splitted_to_number(splitted_digit)
}

impl OcrIterator {
    pub fn new(ocr: Ocr) -> Self {
        Self {
            ocr,
            position: START_POS,
        }
    }

    fn get_number_at_position(&mut self) -> String {
        map_to_number(self.peel_rows())
    }

    fn peel_rows(&mut self) -> Vec<String> {
        let mut peels = vec![];
        let peel = |row: &str| peels.extend(self.peel(row));
        self.ocr.rows.iter().map(|s| &**s).for_each(peel);
        peels
    }

    fn peel(&self, row: &str) -> Option<String> {
        Some(row[get_range(self.position)].to_string())
    }

    fn has_next(&mut self) -> bool {
        self.position >= self.ocr.rows[REFERENCE_ROW].len()
    }

    fn increment_position(&mut self) {
        self.position += DIGIT_WIDTH;
    }

    fn reset_position(&mut self) {
        self.position = START_POS;
    }
}

impl Iterator for OcrIterator {
    type Item = String;
    fn next(&mut self) -> Option<Self::Item> {
        if self.has_next() {
            self.reset_position();
            return None;
        }
        let next = Some(self.get_number_at_position());
        self.increment_position();
        next
    }
}
