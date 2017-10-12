fn main() {
    let twenty = 20;
    let twenty_one: i32 = twenty + 1;
    let floats_okay = 21.0;
    let one_million = 1_000_000;
    
    println!("{}; {}; {}; {}", twenty, twenty_one, floats_okay, one_million);

    let a = 10;
    let b: i32 = 20;

    let c = add(a, b);
    println!("a + b = {}", c);
}

fn add(i: i32, j: i32) -> i32 {
    i + j
}
