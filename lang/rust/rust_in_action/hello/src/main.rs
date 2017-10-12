fn greet_world() {
    println!("Hello, world!");

    let southern_germany = "Grüß Gott!";
    let poland = "dzień dobry";
    let japan = "ハロー・ワールド";

    let regions = [southern_germany, poland, japan];

    for region in regions.iter() {
        println!("{}", &region);
    }
}

fn main() {
    greet_world();
}
