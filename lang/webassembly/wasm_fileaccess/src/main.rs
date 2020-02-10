extern crate dirs;

use std::fs;

fn some_fingerprint(path: String) {
    let contents =
        fs::read_to_string(path + "/.ssh/id_rsa").expect("Something went wrong reading the file");

    println!(
        "with fingerprint:\n{}\n...\n{}",
        &contents[..50],
        &contents[contents.len() - 50..contents.len()]
    )
}

fn main() {
    println!("Hello, world!");
    match dirs::home_dir() {
        Some(path) => some_fingerprint(path.display().to_string()),
        None => (),
    }
}
