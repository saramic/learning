# Advent of Code 2020

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
