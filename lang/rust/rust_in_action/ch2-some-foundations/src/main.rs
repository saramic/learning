fn main() {
    let needle = 42;
    let haystack = [1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862];

    for reference in haystack.iter() {
        if reference == &needle {
            println!("{}", reference)
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

fn add(i: i32, j: i32) -> i32 {
    i + j
}
