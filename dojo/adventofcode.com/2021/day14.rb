sample = <<~EO_SAMPLE
  NNCB

  CH -> B
  HH -> N
  CB -> H
  NH -> C
  HB -> C
  HC -> B
  HN -> C
  NN -> C
  BH -> H
  NC -> B
  NB -> B
  BN -> B
  BB -> N
  BC -> B
  CC -> N
  CN -> C
EO_SAMPLE

steps = 5

def parse_data(input)
  lines = input.split("\n")
  start = lines[0]
  rest = lines.slice(2, lines.length).map do |line|
    [line.split[0], line.split[2]]
  end.to_h
  [start, rest]
end

def naive_apply(line, rules)
  output = line.chars.first
  (0..(line.length-2))
    .to_a
    .each do |index|
      chars2 = line.slice(index, 2)
      output += rules[chars2] + chars2.chars.last
    end
  output
end

line, rules = parse_data(sample)

current_line = line.clone

def letter_count_for(line)
  line
    .chars
    .group_by(&:itself)
    .reduce({}) do |accum, (k, v)|
      accum[k] = v.size
      accum
    end
end

10.times do |index|
    puts "step #{index} and with #{current_line.length}"
    # puts current_line
    # pp letter_count_for(current_line)
    current_line = naive_apply(current_line, rules)
    pp current_line.chars.each_with_index.map{|e,i| next if i > current_line.length - 2; current_line.slice(i, 2) }.compact.map{|pairs| [pairs, 1] }.to_h
  end

letter_count = letter_count_for(current_line)

max_count = letter_count.values.max
min_count = letter_count.values.min
puts max_count - min_count
pp current_line
pp letter_count
puts "END NAIVE"

@letter_count = Hash.new(0)

def apply(line, rules)
  output = line.filter{|k,v| v > 0}.to_h
  line
    .each do |key, value|
      @letter_count[rules[key]] += value
      [
        key.chars.first + rules[key],
        rules[key] + key.chars.last,
      ].each do |pair|
        output[pair] ||= 0
        output[pair] += value
      end
      output[key] -= value if output.has_key?(key)
      output.delete(key) if output[key] <= 0
    end
  output
end

line, rules = parse_data(sample)
line, rules = parse_data(DATA.read)

# current_line = line
#   .chars
#   .each_with_index
#   .map do |e,i|
#     next if i > current_line.length - 2
#     current_line.slice(i, 1)
#   end.compact.map{ |pairs| [pairs, 0] }.to_h

# TODO above is buggy?
current_line = line.chars.each_with_index.map{|e,i| next if i > line.length - 2; line.slice(i, 2) }.compact.map{|pairs| [pairs, 1] }.to_h
line.chars.tally.each{|(k,v)| @letter_count[k] += v }
steps = 10 
steps.times do |index|
    puts "step #{index} and with #{current_line.length}"
    # puts current_line
    # current_line = naive_apply(current_line, rules)
    current_line = apply(current_line, rules)
    pp current_line
    pp [
      @letter_count.sort_by(&:last).first,
      @letter_count.sort_by(&:last).last,
    ]
  end

# @letter_count = Hash.new(0)
# current_line
#   .each do |pair, count|
#     @letter_count[pair.chars.first] += count
#     @letter_count[pair.chars.last] += count
#   end

pp @letter_count
pp @letter_count.sort_by(&:last).first
pp @letter_count.sort_by(&:last).last

max_count = @letter_count.values.max
min_count = @letter_count.values.min
puts max_count - min_count

__END__
CHBBKPHCPHPOKNSNCOVB

SP -> K
BB -> H
BH -> S
BS -> H
PN -> P
OB -> S
ON -> C
HK -> K
BN -> V
OH -> F
OF -> C
SN -> N
PF -> H
CF -> F
HN -> S
SK -> F
SS -> C
HH -> C
SO -> B
FS -> P
CB -> V
NK -> F
KK -> P
VN -> H
KF -> K
PS -> B
HP -> B
NP -> P
OO -> B
FB -> V
PO -> B
CN -> O
HC -> B
NN -> V
FV -> F
BK -> K
VC -> K
KV -> V
VF -> V
FO -> O
FK -> B
HS -> C
OV -> F
PK -> F
VV -> S
NH -> K
SH -> H
VB -> H
NF -> P
OK -> B
FH -> F
CO -> V
BC -> K
PP -> S
OP -> V
VO -> C
NC -> F
PB -> F
KO -> O
BF -> C
VS -> K
KN -> P
BP -> F
KS -> V
SB -> H
CH -> N
HF -> O
CV -> P
NB -> V
FF -> H
OS -> S
CS -> S
KC -> F
NS -> N
NV -> O
SV -> V
BO -> V
BV -> V
CC -> F
CK -> H
KP -> C
KH -> H
KB -> F
PH -> P
VP -> P
OC -> F
FP -> N
HV -> P
HB -> H
PC -> N
VK -> H
HO -> V
CP -> F
SF -> N
FC -> P
NO -> K
VH -> S
FN -> F
PV -> O
SC -> N
