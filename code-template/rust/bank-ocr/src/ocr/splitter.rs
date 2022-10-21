pub fn split_raw_digits(raw_digits: &str) -> Vec<String> {
    let mut rows = vec![];
    raw_digits
        .to_string()
        .split('\n')
        .for_each(|s| rows.extend(Some(s.to_string())));
    rows
}
