# Advent of Code 2020

## day 10 

```ruby
data = File.
  open("/Users/michael/Downloads/aoc_input_day_10.txt").
  read.
  split("\n").
  map(&:to_i)

device_joltage = data.max + 3
last_num = 0;
(data+ [data.max + 3]).
  sort.
  reduce({}) {|acc, num|
    acc[num - last_num] ||= 0
    acc[num - last_num] += 1
    last_num = num
    acc
  }.
  values.
  reduce(:*)
```

```ruby
data = dd

options = ([0] + dd+ [dd.max + 3]).
  sort.
  each_with_object({}){|a, acc| acc[a] = ([0] + dd + [dd.max + 3]).
  find_all{|e| e > a && e <= (a + 3)}}
found = options.
  map{|k,vals|
    vals.map{|val|
      options.map{|ok_k, ok_vals| ok_k == val ? ok_vals.length : nil
    }.compact}
  }.flatten
# now work out how many actual paths there are?
```

## day 8

```ruby
data = File.
  open("/Users/michael/Downloads/aoc_input_day_08.txt").
  read.
  split("\n")

pointer = 0
instructions = []
acc = 0
while !instructions.include?(pointer)
  instructions << pointer
  (cmd, sign, num) = data[pointer].split(/\b/)
  case(cmd)
    when "acc"
      acc = acc.send(sign.strip, num.to_i)
      pointer += 1
    when "jmp"
      pointer = pointer.send(sign.strip, num.to_i)
    else
      pointer += 1
  end
end
acc
```

```ruby
pointer = 0
instructions = []
acc = 0
data.
  each_with_index.
  find_all{|inst, index| inst =~ /jmp|nop/ }.
  map{|inst, index|
    pointer = 0
    instructions = []
    acc = 0
    new_data = data.map(&:clone)
    inst =~ /jmp/ ?
      new_data[index].gsub!("jmp", "nop") :
      new_data[index].gsub!("nop", "jmp")
    while instructions.count{|i| i == pointer} < 3
      instructions << pointer
      break if pointer >= new_data.length
      (cmd, sign, num) = new_data[pointer].split(/\b/)
      case(cmd)
        when "acc"
          acc = acc.send(sign.strip, num.to_i)
          pointer += 1
        when "jmp"
          pointer = pointer.send(sign.strip, num.to_i)
        else
          pointer += 1
      end
    end
    [acc, pointer]
  }.find_all{|acc, pointer| pointer == data.length }.uniq
```

## day 7

## day 6

## day 5

```ruby
data = File.open("/Users/michael/Downloads/aoc_input_day_05.txt").read
boarding_passes = data.split("\n")
def to_bin(string,start,stop,char)
  string.slice(start, stop).chars.map{|c| c == char ? 1 : 0}.join.to_i(2)
end

boarding_passes
  .map{|bp|
    row = to_bin(bp, 0, 7, "B")
    col = to_bin(bp, 7, 3, "R")
    row * 8 + col
  }.max
```

```ruby
boarding_passes
   .map{|bp|
     row = to_bin(bp, 0, 7, "B");
     col = to_bin(bp, 7, 3, "R");
     [row, col, row * 8 + col]
   }
   .sort_by{|a,b,c| a}
   .group_by{|a,b,c| a}
   .map{|k,vals| [k, vals.length, vals] }
   .sort_by{|row, seats, vals| seats }
   .first(3)

# which lead to
last_index = nil
boarding_passes
  .sort
  .map{|bp|
    row = to_bin(bp, 0, 7, "B")
    col = to_bin(bp, 7, 3, "R")
    [bp, row * 8 + col]
  }
  .sort_by{|a,b| b}
  .each_with_index
  .map{|(bp, number), index| [bp, number, index] }
  .find_all{|bp, number, index|
    result = true unless last_index.nil? || (last_index + 1) == number
    last_index = number; result
  }.map{|a| a[1] - 1}
```

## day 4

```ruby
data = File.open("/Users/michael/Downloads/aoc_input_day_04.txt").read
required = [
  'byr', # (Birth Year)
  'iyr', # (Issue Year)
  'eyr', # (Expiration Year)
  'hgt', # (Height)
  'hcl', # (Hair Color)
  'ecl', # (Eye Color)
  'pid', # (Passport ID)
  # 'cid', # (Country ID)
]
passports = data.split("\n\n")

passports.count - passports.count{|p| required.find{|r| p !~ /#{r}/im }}
```

**WRONG** :(

```ruby
passports.count{|p|
  fields = Hash[p.split(/\s/).map{|field| field.split(":")}]
  output = []
  (
    (fields.keys.sort - ["cid"]) == required.sort) &&
    fields.find{|k,v|
      case(k)
      when "byr"
        v.to_i.between?(1920, 2002)
      when "iyr"
        v.to_i.between?(2010, 2020)
      when "eyr"
        v.to_i.between?(2020, 2030)
      when "hgt"
        _, height, unit = /(\d+)(?:in|cm)/.match(v)
        height && ((unit == "cm" && height.between?(150, 193)) ||
          (unit == "in" && height.between?(59, 76))
        )
      when "hcl"
        /#[0-9a-f]{6}/.match(v)
      when "ecl"
        (%w[amb blu brn gry grn hzl oth].any?{|str| str.eql?(v) })
      when "pid"
        /^[0-9]{9}$/.match(v)
      end
    }
}
```

## day 3

```ruby
data = File.open("/Users/michael/Downloads/aoc_input_day_03.txt").read

rows = data.split("\n")

(1..(rows.length - 1)).to_a.count{|row|
  rows[row].chars[(row * 3) % rows[row].length] == "#"
}
```

```ruby
[[1,1],[3,1],[5,1],[7,1],[1,2]].map {|across, down|
  (down..(rows.length - 1)).step(down).to_a.count{|row|
    rows[row].chars[((row/down) * across) % rows[row].length] == "#"
  }
}.reduce(:*)
```

## day 2

```ruby
data.split("\n").count{|line|
    matches = /(\d+)-(\d+) (.): (.*$)/.match(line)
    from = matches[1].to_i
    to = matches[2].to_i
    char = matches[3]
    string = matches[4]
    found_count = string.chars.count{|c| c == char}
    found_count >= from && found_count <= to
}
```

```ruby
data.split("\n").count{|line|
    matches = /(\d+)-(\d+) (.): (.*$)/.match(line)
    from = matches[1].to_i - 1 
    to = matches[2].to_i - 1
    char = matches[3]
    string = matches[4]
    (string.chars[from] == char && string.chars[to] != char) ||
      (string.chars[from] != char && string.chars[to] == char)
}
```

## day 1

```ruby
data.map(&:to_i).
find{|i| j = data.map(&:to_i).
  find{|j| i + j == 2020 };
  puts i * j if j
}
```

```ruby
data = data.map(&:to_i)
data.each{|i| j = data.each{|j| k = data.find{|k| i + j + k == 2020}; puts i * j * k if k } }
```
