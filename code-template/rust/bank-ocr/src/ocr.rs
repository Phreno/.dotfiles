pub mod mapper;
mod range_helper;
mod splitter;

const DIGIT_WIDTH: usize = 3;
const START_POS: usize = 0;
const REFERENCE_ROW: usize = 0;

#[derive(Clone)]
pub struct Ocr {
    rows: Vec<String>,
    position: usize,
}

impl Ocr {
    pub fn new(raw_digits: &str) -> Self {
        Self {
            rows: splitter::split_raw_digits(raw_digits),
            position: START_POS,
        }
    }

    fn get_number_at_position(&mut self) -> String {
        map_to_number(self.get_splitted_digit_at_position())
    }

    fn get_splitted_digit_at_position(&mut self) -> Vec<String> {
        let mut splitted_digit = vec![];
        let slice_digit_at_position = |row| splitted_digit.extend(self.get_slice_from_row(row));
        self.rows.iter().for_each(slice_digit_at_position);
        splitted_digit
    }

    fn get_slice_from_row(&self, row: &String) -> Option<String> {
        Some(row[get_range(self.position)].to_string())
    }

    pub fn parse(&mut self) -> String {
        let mut parsed = "".to_string();
        let concat_number = |number: String| parsed.push_str(number.as_str());
        self.for_each(concat_number);
        parsed
    }

    fn has_next(&mut self) -> bool {
        self.position >= self.rows[REFERENCE_ROW].len()
    }

    fn increment_position(&mut self) {
        self.position += DIGIT_WIDTH;
    }

    fn reset_position(&mut self) {
        self.position = START_POS;
    }
}

fn get_range(position: usize) -> std::ops::Range<usize> {
    range_helper::get_range_from_position(position)
}

fn map_to_number(splitted_digit: Vec<String>) -> String {
    mapper::map_splitted_to_number(splitted_digit)
}

impl Iterator for Ocr {
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

#[cfg(test)]
mod tests {
    use crate::ocr::mapper::digits;

    use super::Ocr;

    #[test]
    fn ocr_next_doit_retourner_none_apres_3_iter_sur_digit_89() {
        let mut ocr = Ocr::new(TEST_89);
        assert_eq!("8", ocr.next().expect("doit etre egal a 8"));
        assert_eq!("9", ocr.next().expect("doit etre egal a 9"));
        assert_eq!(None, ocr.next());
    }

    #[test]
    fn ocr_next_doit_retourner_9_lorsque_2_iter_sur_digit_89() {
        let mut ocr = Ocr::new(TEST_89);
        ocr.next();
        assert_eq!(
            "9",
            ocr.next()
                .expect("impossible de récupérer le digit suivant")
        );
    }

    #[test]
    fn ocr_next_doit_retourner_8_lorsque_iter_sur_digit_89() {
        let mut ocr = Ocr::new(TEST_89);
        assert_eq!(
            "8",
            ocr.next()
                .expect("impossible de récupérer le digit suivant")
        );
    }

    #[test]
    fn ocr_doit_retourner_1_lorsque_iter_sur_digit_1() {
        let mut ocr = Ocr::new(digits::DIGIT_1);
        assert_eq!(
            "1",
            ocr.next()
                .expect("impossible de récupérer le digit suivant")
        );
    }

    #[test]
    fn ocr_doit_retourner_0_lorsque_iter_sur_digit_0() {
        let mut ocr = Ocr::new(digits::DIGIT_0);
        assert_eq!(
            "0",
            ocr.next()
                .expect("impossible de récupérer le digit suivant")
        );
    }

    #[test]
    fn new_ocr_doit_pouvoir_distinguer_la_premiere_ligne() {
        let ocr = Ocr::new(digits::DIGIT_0);
        assert_eq!(
            " _ ",
            ocr.rows
                .get(0)
                .expect("impossible de lire la premiere ligne")
        );
    }
    #[test]
    fn new_ocr_doit_pouvoir_distinguer_la_deuxieme_ligne() {
        let ocr = Ocr::new(digits::DIGIT_0);
        assert_eq!(
            "| |",
            ocr.rows
                .get(1)
                .expect("impossible de lire la deuxieme ligne")
        );
    }
    #[test]
    fn new_ocr_doit_pouvoir_distinguer_la_troisieme_ligne() {
        let ocr = Ocr::new(digits::DIGIT_0);
        assert_eq!(
            "|_|",
            ocr.rows
                .get(2)
                .expect("impossible de lire la troisieme ligne")
        );
    }

    const TEST_89: &str = " _  _ 
|_||_|
|_| _|";
}
