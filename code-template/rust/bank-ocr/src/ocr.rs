use std::{ ops::Range};

pub mod digits;


pub struct Ocr {
    rows: Vec<String>,
    position: usize,
}

impl Ocr {
    fn new(raw_digits: &str) -> Self {
        let mut rows = vec![];
        raw_digits
            .to_string()
            .split("\n")
            .for_each(|s| rows.extend(Some(s.to_string())));
        Self {
            rows,
            position: 0,
        }
    }

    fn get_digit_at_cursor(&mut self) -> String {
        let mut splitted_digit = vec![];
        self.rows.iter().for_each(|split| {
            splitted_digit.extend(Some(
                split[Range {
                    start: self.position,
                    end: self.position + 3,
                }]
                .to_string(),
            ));
        });

        digits::OCR_DIGITS
            .get(splitted_digit.join("\n").as_str())
            .expect("Le digit doit exister")
            .to_string()
    }

    fn parse(&mut self) -> String {
        let mut parsed = "".to_string();
        self.for_each(|x| parsed.push_str(x.as_str()));
        parsed
    }
}

impl Iterator for Ocr {
    type Item = String;
    fn next(&mut self) -> Option<Self::Item> {
        if self.position >= self.rows[0].len() {
            self.position = 0;
            return None;
        }
        let next = Some(self.get_digit_at_cursor());
        self.position += 3;
        next
    }
}

#[cfg(test)]
mod tests {
    use super::{digits, Ocr};

    #[test]
    fn parse_doit_pouvoir_gerer_le_use_case_123456789(){
    let mut ocr = Ocr::new(digits::USE_CASE_123456789);
        assert_eq!("123456789", ocr.parse());
    }
    #[test]
    fn parse_doit_pouvoir_gerer_le_use_case_999999999(){
    let mut ocr = Ocr::new(digits::USE_CASE_999999999);
        assert_eq!("999999999", ocr.parse());
    }
    #[test]
    fn parse_doit_pouvoir_gerer_le_use_case_888888888(){
    let mut ocr = Ocr::new(digits::USE_CASE_888888888);
        assert_eq!("888888888", ocr.parse());
    }
    #[test]
    fn parse_doit_pouvoir_gerer_le_use_case_777777777(){
    let mut ocr = Ocr::new(digits::USE_CASE_777777777);
        assert_eq!("777777777", ocr.parse());
    }
    #[test]
    fn parse_doit_pouvoir_gerer_le_use_case_666666666(){
    let mut ocr = Ocr::new(digits::USE_CASE_666666666);
        assert_eq!("666666666", ocr.parse());
    }
    #[test]
    fn parse_doit_pouvoir_gerer_le_use_case_555555555(){
    let mut ocr = Ocr::new(digits::USE_CASE_555555555);
        assert_eq!("555555555", ocr.parse());
    }
    #[test]
    fn parse_doit_pouvoir_gerer_le_use_case_444444444(){
    let mut ocr = Ocr::new(digits::USE_CASE_444444444);
        assert_eq!("444444444", ocr.parse());
    }
    #[test]
    fn parse_doit_pouvoir_gerer_le_use_case_333333333(){
    let mut ocr = Ocr::new(digits::USE_CASE_333333333);
        assert_eq!("333333333", ocr.parse());
    }
    #[test]
    fn parse_doit_pouvoir_gerer_le_use_case_222222222(){
    let mut ocr = Ocr::new(digits::USE_CASE_222222222);
        assert_eq!("222222222", ocr.parse());
    }

    #[test]
    fn parse_doit_pouvoir_gerer_le_use_case_111111111(){
    let mut ocr = Ocr::new(digits::USE_CASE_111111111);
        assert_eq!("111111111", ocr.parse());
    }
    
    #[test]
    fn parse_doit_pouvoir_gerer_le_use_case_000000000(){
        let mut ocr = Ocr::new(digits::USE_CASE_000000000);
        assert_eq!("000000000", ocr.parse());
    }

    #[test]
    fn parse_doit_pouvoir_etre_jouer_plusieurs_fois_de_suite(){
        let mut ocr = Ocr::new(digits::TEST_89);
        assert_eq!("89", ocr.parse());
        assert_eq!("89", ocr.parse());
    }

    #[test]
    fn parse_doit_retourner_89_apres_avoir_passer_89() {
        let mut ocr = Ocr::new(digits::TEST_89);
        assert_eq!("89", ocr.parse());
    }

    #[test]
    fn ocr_next_doit_retourner_none_apres_3_iter_sur_digit_89() {
        let mut ocr = Ocr::new(digits::TEST_89);
        assert_eq!("8", ocr.next().expect("doit etre egal a 8"));
        assert_eq!("9", ocr.next().expect("doit etre egal a 9"));
        assert_eq!(None, ocr.next());
    }

    #[test]
    fn ocr_next_doit_retourner_9_lorsque_2_iter_sur_digit_89() {
        let mut ocr = Ocr::new(digits::TEST_89);
        ocr.next();
        assert_eq!(
            "9",
            ocr.next()
                .expect("impossible de récupérer le digit suivant")
        );
    }

    #[test]
    fn ocr_next_doit_retourner_8_lorsque_iter_sur_digit_89() {
        let mut ocr = Ocr::new(digits::TEST_89);
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
}
