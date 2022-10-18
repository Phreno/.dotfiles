fn main() {
    (0..100).for_each(|x| println!("{}", fizzbuzz::fizzbuzz(x)));
}

mod fizzbuzz {
    pub fn fizzbuzz(nb: i32) -> String {
        let fizz = nb % 3 == 0;
        let buzz = nb % 5 == 0;
        let mut result = String::new();

        if fizz {
            result.push_str("fizz");
        }

        if buzz {
            result.push_str("buzz");
        }

        if 0 == result.len() {
            return nb.to_string();
        } else {
            return result;
        }
    }
}

#[cfg(test)]
mod test {
    use crate::fizzbuzz::fizzbuzz;
    #[test]
    fn fizzbuzz_doit_retourner_1_lorsque_1() {
        assert_eq!("1", fizzbuzz(1));
    }
    #[test]
    fn fizzbuzz_doit_retourner_fizz_lorsque_3() {
        assert_eq!("fizz", fizzbuzz(3));
    }
    #[test]
    fn fizzbuzz_doit_retourner_buzz_lorsque_5() {
        assert_eq!("buzz", fizzbuzz(5));
    }
    #[test]
    fn fizzbuzz_doit_retourner_fizzbuzz_lorsque_15() {
        assert_eq!("fizzbuzz", fizzbuzz(15));
    }
}
