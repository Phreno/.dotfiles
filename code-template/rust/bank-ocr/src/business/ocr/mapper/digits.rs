use lazy_static::lazy_static;
use std::collections::HashMap;

lazy_static! {
    pub static ref OCR_DIGITS: HashMap<&'static str, &'static str> = {
        let mut map = HashMap::new();
        map.insert(DIGIT_0, "0");
        map.insert(DIGIT_1, "1");
        map.insert(DIGIT_2, "2");
        map.insert(DIGIT_3, "3");
        map.insert(DIGIT_4, "4");
        map.insert(DIGIT_5, "5");
        map.insert(DIGIT_6, "6");
        map.insert(DIGIT_7, "7");
        map.insert(DIGIT_8, "8");
        map.insert(DIGIT_9, "9");
        map
    };
}

pub const DIGIT_0: &str = " _ 
| |
|_|";

pub const DIGIT_1: &str = "   
  |
  |";

pub const DIGIT_2: &str = " _ 
 _|
|_ ";

pub const DIGIT_3: &str = " _ 
 _|
 _|";

pub const DIGIT_4: &str = "   
|_|
  |";

pub const DIGIT_5: &str = " _ 
|_ 
 _|";

pub const DIGIT_6: &str = " _ 
|_ 
|_|";

pub const DIGIT_7: &str = " _ 
  |
  |";

pub const DIGIT_8: &str = " _ 
|_|
|_|";

pub const DIGIT_9: &str = " _ 
|_|
 _|";

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn doit_retourner_0_lorsque_arg_digit_0() {
        assert_eq!(
            "0",
            OCR_DIGITS
                .get(DIGIT_0)
                .expect("Le digit 0 doit exister")
                .to_string()
        );
    }

    #[test]
    fn doit_retourner_1_lorsque_arg_digit_1() {
        assert_eq!(
            "1",
            OCR_DIGITS
                .get(DIGIT_1)
                .expect("Le digit 1 doit exister")
                .to_string()
        );
    }

    #[test]
    fn doit_retourner_2_lorsque_arg_digit_2() {
        assert_eq!(
            "2",
            OCR_DIGITS
                .get(DIGIT_2)
                .expect("Le digit 2 doit exister")
                .to_string()
        );
    }

    #[test]
    fn doit_retourner_3_lorsque_arg_digit_3() {
        assert_eq!(
            "3",
            OCR_DIGITS
                .get(DIGIT_3)
                .expect("Le digit 3 doit exister")
                .to_string()
        );
    }

    #[test]
    fn doit_retourner_4_lorsque_arg_digit_4() {
        assert_eq!(
            "4",
            OCR_DIGITS
                .get(DIGIT_4)
                .expect("Le digit 4 doit exister")
                .to_string()
        );
    }

    #[test]
    fn doit_retourner_5_lorsque_arg_digit_5() {
        assert_eq!(
            "5",
            OCR_DIGITS
                .get(DIGIT_5)
                .expect("Le digit 5 doit exister")
                .to_string()
        );
    }

    #[test]
    fn doit_retourner_6_lorsque_arg_digit_6() {
        assert_eq!(
            "6",
            OCR_DIGITS
                .get(DIGIT_6)
                .expect("Le digit 6 doit exister")
                .to_string()
        );
    }

    #[test]
    fn doit_retourner_7_lorsque_arg_digit_7() {
        assert_eq!(
            "7",
            OCR_DIGITS
                .get(DIGIT_7)
                .expect("Le digit 7 doit exister")
                .to_string()
        );
    }

    #[test]
    fn doit_retourner_8_lorsque_arg_digit_8() {
        assert_eq!(
            "8",
            OCR_DIGITS
                .get(DIGIT_8)
                .expect("Le digit 8 doit exister")
                .to_string()
        );
    }

    #[test]
    fn doit_retourner_9_lorsque_arg_digit_9() {
        assert_eq!(
            "9",
            OCR_DIGITS
                .get(DIGIT_9)
                .expect("Le digit 9 doit exister")
                .to_string()
        );
    }
}
