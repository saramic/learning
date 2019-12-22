use std::io;
use std::io::prelude::*;

fn process_lines<T: BufRead + Sized>(reader: T) {
  let mut sum = 0;
  for line in reader.lines() {
    sum += (line.unwrap().parse::<i32>().unwrap() / 3) - 2;
  }
  println!("{}", sum);
}

fn main() {
  let stdin = io::stdin();
  let reader = stdin.lock();
  process_lines(reader);
}