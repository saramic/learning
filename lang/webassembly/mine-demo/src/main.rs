mod lib;

use lib::{rust_mine_first, rust_mine_hex};

fn main() {
    let result = rust_mine_hex("");
    println!("{}", result);
}
