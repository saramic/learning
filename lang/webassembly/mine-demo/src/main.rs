mod lib;

use lib::rust_mine;

fn main() {
    let result = rust_mine("hello".to_string());
    println!("{}", result);
}
