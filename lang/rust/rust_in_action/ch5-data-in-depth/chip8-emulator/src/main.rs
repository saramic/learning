const ADD_XY: u8 = 0x8; // constant for addition

struct CPU {
    current_operation: u16,
    registers: [u8; 2],
}

impl CPU {
    fn run(&mut self) {
        let enocded_op = self.current_operation;
        let op = ((enocded_op & 0xF000) >> 12) as u8; // assign each bit field to own
        let x  = ((enocded_op & 0x0F00) >>  8) as u8; // variable
        let y  = ((enocded_op & 0x00F0) >>  4) as u8; // variable

        match op {
            ADD_XY => {
                self.add_xy(x,y);
            },
            _ => unimplemented!(),
        }
    }

    fn add_xy(&mut self, x: u8, y: u8) {
        self.registers[x as usize] += self.registers[y as usize];
    }
}

fn main() {
    let mut cpu = CPU {
        current_operation: 0x8014,
        registers: [0; 2],
    };

    cpu.registers[0] = 5;
    cpu.registers[1] = 10;

    cpu.run();

    assert_eq!(cpu.registers[0], 15);

    println!("5 + 10 = {}", cpu.registers[0]);
}

