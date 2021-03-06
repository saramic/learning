#![allow(dead_code)]
#![allow(unused_variables)]

//! Simulating files one step at a time.

use std::fmt;
use std::fmt::{Display};

#[derive(Debug,PartialEq)]
enum FileState {
    Open,
    Closed,
}

/// Represnets a "file", which probably lives on a file system.
#[derive(Debug)]
struct File {
    pub name: String,
    data: Vec<u8>,
    pub state: FileState,
}

impl Display for FileState {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match *self {
            FileState::Open => write!(f, "OPEN"),
            FileState::Closed => write!(f, "CLOSED"),
        }
    }
}

impl Display for File {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "<{} ({})>", self.name, self.state)
    }
}

impl File {
    /// New files are assumed to be empty, but a name is required
    ///
    /// # Examples
    ///
    /// ```
    /// let f = File::new("file.txt");
    /// ```
    pub fn new(name: &str) -> File {
        File {
            name: String::from(name),
            data: Vec::new(),
            state: FileState::Closed,
        }
    }

    fn new_with_data(name: &str, data: &Vec<u8>) -> File {
        let mut f = File::new(name);
        f.data = data.clone();
        f
    }

    fn read(self: &File, save_to: &mut Vec<u8>) -> usize {
        let mut tmp = self.data.clone();
        let read_length = tmp.len();
        save_to.reserve(read_length);
        save_to.append(&mut tmp);
        read_length
    }

    /// Returns the file's length in bytes.
    pub fn len(&self) -> usize {
        self.data.len()
    }

    /// Returns the file's name.
    pub fn name(&self) -> String {
        self.name.clone()
    }
}

fn open(f: &mut File) -> bool {
    true
}

fn close(f: &mut File) -> bool {
    true
}

fn main() {
    let data: Vec<u8> = vec![114, 117, 115, 116, 33];
    let mut file = File::new_with_data("file.txt", &data);

    let mut buffer: Vec<u8> = vec![];

    open(&mut file);
    let length = &file.read(&mut buffer);
    close(&mut file);

    let text = String::from_utf8_lossy(&buffer);

    println!("{:?}", file);
    println!("{} is {} bytes long", &file.name, length);
    println!("{}", text);
}
