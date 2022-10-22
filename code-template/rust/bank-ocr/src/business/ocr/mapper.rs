pub mod digits;

pub fn map_splitted_to_raw_ocr(splitted_digit: Vec<String>) -> String {
    splitted_digit.join("\n")
}

pub fn map_splitted_to_number(splitted_digit: Vec<String>) -> String {
    digits::OCR_DIGITS
        .get(map_splitted_to_raw_ocr(splitted_digit).as_str())
        .expect("Le digit doit exister")
        .to_string()
}
