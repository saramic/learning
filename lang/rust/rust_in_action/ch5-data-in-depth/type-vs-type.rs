#![allow(overflowing_literals)]

fn main() {
    println!("int vs int");

    let a: u16 = 0b1100_0011_1100_0011;
    let b: i16 = 0b1100_0011_1100_0011; // overflowing literal
    println!("a: {}", a);
    println!("b: {}", b);

    println!("");
    println!("float to int frankentype");

    let a: f32 = 42.42;
    let frankentype: u32 = unsafe {
        std::mem::transmute(a)
    };

    println!("{:032b}", frankentype);

    println!("");
    println!("u16 bit patterns");

    let  zero:       u16 = 0b0000_0000_0000_0000;
    let  one:        u16 = 0b0000_0000_0000_0001;
    let  two:        u16 = 0b0000_0000_0000_0010;

    let  num_65_533: u16 = 0b1111_1111_1111_1101;
    let  num_65_534: u16 = 0b1111_1111_1111_1110;
    let  num_65_535: u16 = 0b1111_1111_1111_1111;

    print!("{}, {}, {}, ..., ", zero, one, two);
    println!("{}, {}, {}, ", num_65_533, num_65_534, num_65_535);
}
