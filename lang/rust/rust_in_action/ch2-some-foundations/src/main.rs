use std::ops::{Add};

fn main() {
    let (a, b) = (1.2, 3.4);
    let (x, y) = (10, 20);

    let c = add(a,b);
    let z = add(x, y);

    println!("{} + {} = {}", a, b, c);
    println!("{} + {} = {}", x, y, z);
    println!("");

    let haystack = [1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862];

    for reference in haystack.iter() {
        let item = *reference;

        let result = match item {
            42 | 132 => "hit!",
            _ => "miss",
        };

        if result == "hit!" {
            println!("{}: {}", item, result);
        }
    }
    println!("");

    let three = 0b11;
    let thirty = 0o36;
    let three_hundred = 0x12C;

    println!("{} {} {}", three, thirty, three_hundred);
    println!("{:b} {:b} {:b}", three, thirty, three_hundred);
    println!("{:o} {:o} {:o}", three, thirty, three_hundred);
    println!("{:x} {:x} {:x}", three, thirty, three_hundred);
    println!("");

    let twenty = 20;
    let twenty_one: i32 = twenty + 1;
    let floats_okay = 21.0;
    let one_million = 1_000_000;
    
    println!("{}; {}; {}; {}", twenty, twenty_one, floats_okay, one_million);
    println!("");

    let a = 10;
    let b: i32 = 20;

    let c = add(a, b);
    println!("a + b = {}", c);
}

fn add<T: Add<Output = T>>(i: T, j: T) -> T {
    i + j
}
