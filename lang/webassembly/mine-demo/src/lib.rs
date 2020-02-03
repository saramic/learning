extern crate sha2;

use sha2::{Digest, Sha256};

pub fn rust_mine(text: String) -> String {
    let mut nonce = 0;
    loop {
        nonce += 1;
        let mut hasher = Sha256::new(); // TODO cannot move out of loop? unless borrow
        hasher.input(format!("{}{}", text, nonce)); // TODO join strings
        let result = hasher.result();
        let result_string = format!("{:x}", result);
        if format!("{}", &result_string[0..5]) == "00000" {
            // println!("{}", nonce); // TODO return array?
            return format!("{}", result_string);
        }
    }
}
