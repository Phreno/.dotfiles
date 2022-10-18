use rand::Rng;
use std::{cmp::Ordering, io};

fn to_number(str: String) -> u32 {
    str.trim().parse().expect("Please type a number")
}

fn nombre_random() -> u32 {
    rand::thread_rng().gen_range(1..=99)
}

fn main() {
    let secret = nombre_random();
    loop {
        println!("Guess me, I'm famous");
        let mut guess = String::new();
        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line");
        match to_number(guess).cmp(&secret) {
            Ordering::Less => println!("nope ..."),
            Ordering::Greater => println!("arggghhhh ..."),
            Ordering::Equal => {
                println!("yep bro");
                break;
            }
        }
    }
}

#[cfg(test)]
mod test {
    use crate::{nombre_random, to_number};

    #[test]
    fn nombre_random_doit_etre_borne_entre_0_et_100() {
        let mut tries = 1000;
        while tries != 0 {
            let nombre = nombre_random();
            println!("{nombre}");
            assert_eq!(true, 0 < nombre);
            assert_eq!(true, 100 > nombre);
            tries -= 1;
        }
    }

    #[test]
    fn to_number_doit_retourner_42_lorsque_42() {
        let mut str = String::new();
        str = str + "42";
        let nb = to_number(str);
        assert_eq!(42, nb);
    }
}
