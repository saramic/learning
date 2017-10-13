use std::ops::{Add};

fn main() {
    println!();

    // ARRAYS
    let one             = [1,2,3];
    let two: [u8; 3]    = [1,2,3];
    let blank1          = [0; 3];
    let blank2: [u8; 3] = [0; 3];

    let arrays = [one, two, blank1, blank2];

    for a in &arrays {
        print!("{:?}: ", a);
        for n in a.iter() {
            print!("\t{} + 10 = {}", n, n+10);
        }

        let mut sum = 0;
        for i in 0..a.len() {
            sum += a[i];
        }
        print!("\t(Σ{:?} = {})", a, sum);
        println!();
    }
    println!();

    // GREP-LITE
    let search_term = "picture";
    let quote = "Every face, every shop, bedroom window, public-house, and
    dark square is a picture feverishly turned--in search of what?
    It is the same with books. What do we seek through millions of pages?";

    for (idx, line) in quote.lines().enumerate() {
        if line.contains(search_term) {
            let line_num = idx + 1;
            println!("{}: {}", line_num, line);
        }
    }
    println!();

    // NUMBERS AND GENERIC FUNCTION
    let (a, b) = (1.2, 3.4);
    let (x, y) = (10, 20);

    let c = add(a,b);
    let z = add(x, y);

    println!("{} + {} = {}", a, b, c);
    println!("{} + {} = {}", x, y, z);
    println!();

    // SIMPLE FINDER
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
    println!();

    // NUMBERS AND BASE SYSTEMS
    let three = 0b11;
    let thirty = 0o36;
    let three_hundred = 0x12C;

    println!("{} {} {}", three, thirty, three_hundred);
    println!("{:b} {:b} {:b}", three, thirty, three_hundred);
    println!("{:o} {:o} {:o}", three, thirty, three_hundred);
    println!("{:x} {:x} {:x}", three, thirty, three_hundred);
    println!();

    // NUMBERS AND TYPES
    let twenty = 20;
    let twenty_one: i32 = twenty + 1;
    let floats_okay = 21.0;
    let one_million = 1_000_000;
    
    println!("{}; {}; {}; {}", twenty, twenty_one, floats_okay, one_million);
    println!();

    let a = 10;
    let b: i32 = 20;

    let c = add(a, b);
    println!("a + b = {}", c);
}

//GENERIC FUNCTION
fn add<T: Add<Output = T>>(i: T, j: T) -> T {
    i + j
}
