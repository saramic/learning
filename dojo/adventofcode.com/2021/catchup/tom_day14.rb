#!/usr/bin/env ruby -Ilib

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

def parse_data(input)
  lines = input.split("\n")
  start = lines[0]
  rest = lines.slice(2, lines.length).map do |line|
    [line.split[0], line.split[2]]
  end.to_h
  [start, rest]
end

line, rules = parse_data(sample)

def pairs_from(str)
  chars = str.chars
  chars.zip(chars.drop(1))[0..-2].map(&:join).tally.sort_by(&:first).to_h
end

STARTING_POLYMER = line # "NNCB"
STARTING_POLYMER = "CHBBKPHCPHPOKNSNCOVB"

$inserted = STARTING_POLYMER.chars.tally

def diff_for(pairs, pattern, sub)
  count = pairs.fetch(pattern, 0)
  left = pattern[0] + sub
  right = sub + pattern[1]

  $inserted[sub] ||= 0
  $inserted[sub] += count

  {pattern => 0, left => 0, right => 0}.tap do |result|
    result[pattern] -= count
    result[left] += count
    result[right] += count

    # pp [pattern, sub, count, result]
  end
end

def top_and_bot
  ranked_chars = $inserted.sort_by(&:last)
  most_common = ranked_chars[-1]
  least_common = ranked_chars[0]

  pp [most_common, least_common]

  puts most_common.last - least_common.last
end

RULES = rules
RULES = DATA.read.split("\n").map { _1.strip.split(' -> ') }.to_h

#EXPECTED = File.read('day14.json').then { JSON.parse(_1) }.map { pairs_from(_1) }

pairs = pairs_from(STARTING_POLYMER)

2.times do |idx|
  puts "Iteration #{idx}"
  top_and_bot
  # pp pairs
  # pp EXPECTED[idx]
  # pp pairs == EXPECTED[idx]

  diffs = RULES.map do |(pattern, sub)|
    diff_for(pairs, pattern, sub)
  end

  pairs = begin
    ([pairs] + diffs).reduce({}) do |result, diff|
      result.merge(diff) do |_key, v1, v2|
        v1 + v2
      end
    end.reject { |k,v| v.zero? }.sort_by(&:first).to_h
  end
  pp pairs
  # pp $inserted
end

puts "-----"
top_and_bot

__END__
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
