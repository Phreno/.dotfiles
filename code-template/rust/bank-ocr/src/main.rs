mod business;

fn main() {
    let path = std::env::args()
        .nth(1)
        .expect("Le chemin du fichier est obligatoire");
    let content = std::fs::read_to_string(path).expect("Le fichier doit exister");
    content
        .split("\n\n")
        .map(|line| business::parse(line.trim_end()))
        .for_each(|line| println!("{}", line));
}
