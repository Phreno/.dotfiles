mod iterator;
pub mod mapper;
mod range;
mod splitter;
const DIGIT_WIDTH: usize = 3;
const START_POS: usize = 0;
const REFERENCE_ROW: usize = 0;

#[derive(Clone)]
pub struct Ocr {
    rows: Vec<String>,
}

impl Ocr {
    pub fn new(raw_digits: &str) -> Self {
        Self {
            rows: splitter::split_raw_digits(raw_digits),
        }
    }

    pub fn parse(&self) -> String {
        let iterator = iterator::OcrIterator {
            ocr: self.to_owned(),
            position: START_POS,
        };
        let mut parsed = "".to_string();
        let concat = |number: String| parsed.push_str(number.as_str());
        iterator.for_each(concat);
        parsed
    }
}

#[cfg(test)]
mod tests {
    use crate::ocr::{iterator::OcrIterator, mapper::digits};

    use super::Ocr;

    #[test]
    fn ocr_next_doit_retourner_none_apres_3_iter_sur_digit_89() {
        let ocr = Ocr::new(TEST_89);
        let mut iterator = OcrIterator { ocr, position: 0 };
        assert_eq!("8", iterator.next().expect("doit etre egal a 8"));
        assert_eq!("9", iterator.next().expect("doit etre egal a 9"));
        assert_eq!(None, iterator.next());
    }

    #[test]
    fn ocr_next_doit_retourner_9_lorsque_2_iter_sur_digit_89() {
        let ocr = Ocr::new(TEST_89);
        let mut iterator = OcrIterator { ocr, position: 0 };
        iterator.next();
        assert_eq!(
            "9",
            iterator
                .next()
                .expect("impossible de récupérer le digit suivant")
        );
    }

    #[test]
    fn ocr_next_doit_retourner_8_lorsque_iter_sur_digit_89() {
        let ocr = Ocr::new(TEST_89);
        let mut iterator = OcrIterator { ocr, position: 0 };
        assert_eq!(
            "8",
            iterator
                .next()
                .expect("impossible de récupérer le digit suivant")
        );
    }

    #[test]
    fn ocr_doit_retourner_1_lorsque_iter_sur_digit_1() {
        let ocr = Ocr::new(digits::DIGIT_1);
        let mut iterator = OcrIterator { ocr, position: 0 };
        assert_eq!(
            "1",
            iterator
                .next()
                .expect("impossible de récupérer le digit suivant")
        );
    }

    #[test]
    fn ocr_doit_retourner_0_lorsque_iter_sur_digit_0() {
        let ocr = Ocr::new(digits::DIGIT_0);
        let mut iterator = OcrIterator { ocr, position: 0 };
        assert_eq!(
            "0",
            iterator
                .next()
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
