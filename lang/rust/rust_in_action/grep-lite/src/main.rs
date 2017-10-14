extern crate clap;
extern crate regex;

use regex::Regex;
use clap::{App,Arg};

fn main() {
    let args = App::new("grep-lite")
        .version("0.1")
        .about("searches for patterns")
        .arg(Arg::with_name("pattern")
             .help("the pattern to search for")
             .takes_value(true)
             .required(true))
        .get_matches();

    let pattern = args.value_of("pattern").unwrap();
    let re = Regex::new(pattern).unwrap();

    // PARAMETERS
    let context_lines = 2;
    let needle = "oo";
    let haystack = "Every face, every shop,
    bedroom window, public-house, and
    dark square is a picture
    feverishly turned--in search of what?
    It is the same with books.
    what do we seek
    through millions of pages?";

    // INITIALIZATINO
    let mut tags: Vec<usize> = Vec::new();
    let mut ctx: Vec<Vec<(usize, String)>> = Vec::new();

    // PASS 1
    for (i, line) in haystack.lines().enumerate() {
        if line.contains(needle) {
            tags.push(i);

            let v = Vec::with_capacity(2*context_lines + 1);
            ctx.push(v)
        }
    }

    if tags.len() == 0 {
        return;
    }

    // PASS 2
    for (i, line) in haystack.lines().enumerate() {
        for (j, tag) in tags.iter().enumerate() {
            let lower_bound = tag.saturating_sub(context_lines);
            let upper_bound = tag + context_lines;

            if (i >= lower_bound) && (i <= upper_bound) {
                let line_as_string = String::from(line);
                let local_ctx = (i, line_as_string);
                ctx[j].push(local_ctx);
            }
        }
    }

    // OUTPUT
    for local_ctx in ctx.iter() {
        for &(i, ref line) in local_ctx.iter() {
            let line_num = i + 1;
            println!("{}: {}", line_num, line);
        }
    }
    println!();

    let quote = "Every face, every shop, bedroom window, public-house, and
    dark square is a picture feverishly turned--in search of what?
    It is the same with books. What do we seek through millions of pages?";

    for (idx, line) in quote.lines().enumerate() {
        match re.find(line) {
            Some(_) => {
                let line_num = idx + 1;
                println!("{}: {}", line_num, line)
            },
            None => (),
        }
    }
}
