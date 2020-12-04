# Advent of Code 2020

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
  valid = (
    (fields.keys.sort - ["cid"]) == required.sort ||
      (output << "missing fields #{required.sort - (fields.keys.sort - ["cid"])} ")
    ) &&
    !fields.find{|k,v|
      case(k)
      when "byr"
        (v.to_i < 1920 || v.to_i > 2002) && (output << "byr")
      when "iyr"
        (v.to_i < 2010 || v.to_i > 2020) && (output << "iyr")
      when "eyr"
        (v.to_i < 2020 || v.to_i > 2030) && (output << "eyr")
      when "hgt"
        m = /(\d+)(?:in|cm)/.match(v)
        (m == nil && (output << "hgt in/cm")) || (
          m[2] == "cm" && (m[1] < 150 || m[1] > 193) ||
          m[2] == "in" && (m[1] < 59 || m[1] > 76)
        ) && (output << "hgt")
      when "hcl"
        !/#[0-9a-f]{6}/.match(v) && (output << "hcl")
      when "ecl"
        !/(?:amb|blu|brn|gry|grn|hzl|oth)/.match(v) && (output << "ecl")
      when "pid"
        !/^[0-9]{9}$/.match(v) && (output << "pid")
      end
    }
  if !valid
    output << valid
    output << p
    puts output.inspect
  end
  valid
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
