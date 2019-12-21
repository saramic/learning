use std::fs::File;
use std::io::BufReader;
use std::io::prelude::*;

fn manually_iterate_lines_in_file() {
    let f = File::open("README.md").unwrap();
    let mut reader = BufReader::new(f);

    let mut line = String::new();
    loop {
        let len = reader.read_line(&mut line).unwrap();
        if len == 0 {
            break
        }

        println!("{} ({} bytes long)", line, len);
        line.truncate(0);
    }
}

fn lines_hepler() {
    let f = File::open("README.md").unwrap();
    let reader = BufReader::new(f);

    for line_ in reader.lines() {
        let line = line_.unwrap();
        println!("{} ({} bytes long)", line, line.len());
    }
}

fn main() {
    println!("------ manually iterate file");
    manually_iterate_lines_in_file();
    println!("------ iterate file with helper");
    lines_hepler();
}
