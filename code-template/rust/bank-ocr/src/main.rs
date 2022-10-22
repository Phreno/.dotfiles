mod business;

fn main() {
    // 1 get path from args
    let path = std::env::args()
        .nth(1)
        .expect("Le chemin du fichier est obligatoire");
    // 2 read file
    let content = std::fs::read_to_string(path).expect("Le fichier doit exister");
    // 3 split file every 4 lines

    // 4 map splitted to number
}
