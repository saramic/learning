# Advent of code

logged in via github

can use session cookie for downloads

```
$ export ADVENT_OF_CODE_COOKIE=536...9fa
```

## Day 18

## Day 17

## Day 16

  --- Day 16: Permutation Promenade ---

  You come upon a very unusual sight; a group of programs here appear to be
  dancing.

  There are sixteen programs in total, named a through p. They start by
  standing in a line: a stands in position 0, b stands in position 1, and so on
  until p, which stands in position 15.

  The programs' dance consists of a sequence of dance moves:

  **Spin**, written sX, makes X programs move from the end to the front, but
  maintain their order otherwise. (For example, s3 on abcde produces cdeab).
  **Exchange**, written xA/B, makes the programs at positions A and B swap places.
  **Partner**, written pA/B, makes the programs named A and B swap places.
  For example, with only five programs standing in a line (abcde), they could do the following dance:

  ```
  s1, a spin of size 1: eabcd.
  x3/4, swapping the last two programs: eabdc.
  pe/b, swapping programs e and b: baedc.
  After finishing their dance, the programs end up in order baedc.
  ```

  You watch the dance for a while and record their dance moves (your puzzle
  input). In what order are the programs standing after their dance?

  ```
  curl 'https://adventofcode.com/2017/day/16/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day16/data.txt
  ```

  ```
  cat day16/data.txt | ruby -e '
  p = ("a".."p").to_a;
  ARGF.read.split(",").each{|i|
    inst = i.chars.first
    vals = i.chomp.chars[1..-1].join.split("/")
    if inst == "s"
      p = p.rotate(- vals.first.to_i)
    else
      a, b = inst == "x" ?
        [vals.first.to_i, vals.last.to_i] :
        [p.index(vals.first), p.index(vals.last)]
      p[a],p[b] = p[b],p[a]
    end;
  };
  puts p.join'

  kpbodeajhlicngmf
  ```

  Your puzzle answer was kpbodeajhlicngmf.

  The first half of this puzzle is complete! It provides one gold star: *

  **--- Part Two ---**

  Now that you're starting to get a feel for the dance moves, you turn your
  attention to the dance as a whole.

  Keeping the positions they ended up in from their previous dance, the
  programs perform it again and again: including the first dance, a total of
  one billion (1000000000) times.

  In the example above, their second dance would begin with the order baedc,
  and use the same dance moves:

  ```
  s1, a spin of size 1: cbaed.
  x3/4, swapping the last two programs: cbade.
  pe/b, swapping programs e and b: ceadb.
  In what order are the programs standing after their billion dances?
  ```

## Day 15

  --- Day 15: Dueling Generators ---

  Here, you encounter a pair of dueling generators. The generators, called
  generator A and generator B, are trying to agree on a sequence of numbers.
  However, one of them is malfunctioning, and so the sequences don't always
  match.

  As they do this, a judge waits for each of them to generate its next value,
  compares the lowest 16 bits of both values, and keeps track of the number of
  times those parts of the values match.

  The generators both work on the same principle. To create its next value, a
  generator will take the previous value it produced, multiply it by a factor
  (generator A uses 16807; generator B uses 48271), and then keep the remainder
  of dividing that resulting product by 2147483647. That final remainder is the
  value it produces next.

  To calculate each generator's first value, it instead uses a specific
  starting value as its "previous value" (as listed in your puzzle input).

  For example, suppose that for starting values, generator A uses 65, while
  generator B uses 8921. Then, the first five pairs of generated values are:

  ```
  --Gen. A--  --Gen. B--
     1092455   430625591
  1181022009  1233683848
   245556042  1431495498
  1744312007   137874439
  1352636452   285222916
  ```

  In binary, these pairs are (with generator A's value first in each pair):

  ```
  00000000000100001010101101100111
  00011001101010101101001100110111

  01000110011001001111011100111001
  01001001100010001000010110001000

  00001110101000101110001101001010
  01010101010100101110001101001010

  01100111111110000001011011000111
  00001000001101111100110000000111

  01010000100111111001100000100100
  00010001000000000010100000000100
  ```
  Here, you can see that the lowest (here, rightmost) 16 bits of the third
  value match: 1110001101001010. Because of this one match, after processing
  these five pairs, the judge would have added only 1 to its total.

  To get a significant sample, the judge would like to consider 40 million
  pairs. (In the example above, the judge would eventually find a total of 588
  pairs that match in their lowest 16 bits.)

  After 40 million pairs, what is the judge's final count?

  ```
  curl 'https://adventofcode.com/2017/day/15/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day15/data.txt
  ```

  ```
  cat day15/data.txt | ruby -e '
    (a, b) = ARGF.read.split("\n").map{|l| l.split.last.to_i }
    puts "a is #{a}\nb is #{b}"
    amul = 16807
    bmul = 48271
    remainder = 2147483647
    tot = 0
    (0..40_000_000).each{ |i|
      a = (a * amul) % remainder
      b = (b * bmul) % remainder
      tot += 1 if ([a].pack("S") == [b].pack("S"))
    }
    puts tot'
  a is 873
  b is 583
  631
  ```

  Your puzzle answer was 631.

  The first half of this puzzle is complete! It provides one gold star: *

  --- Part Two ---

  In the interest of trying to align a little better, the generators get more
  picky about the numbers they actually give to the judge.

  They still generate values in the same way, but now they only hand a value to the judge when it meets their criteria:

  Generator A looks for values that are multiples of 4.
  Generator B looks for values that are multiples of 8.

  Each generator functions completely independently: they both go through
  values entirely on their own, only occasionally handing an acceptable value
  to the judge, and otherwise working through the same sequence of values as
  before until they find one.

  The judge still waits for each generator to provide it with a value before
  comparing them (using the same comparison method as before). It keeps track
  of the order it receives values; the first values from each generator are
  compared, then the second values from each generator, then the third values,
  and so on.

  Using the example starting values given above, the generators now produce the
  following first five values each:

  ```
  --Gen. A--  --Gen. B--
  1352636452  1233683848
  1992081072   862516352
   530830436  1159784568
  1980017072  1616057672
   740335192   412269392
  ```
  These values have the following corresponding binary values:

  ```
  01010000100111111001100000100100
  01001001100010001000010110001000

  01110110101111001011111010110000
  00110011011010001111010010000000

  00011111101000111101010001100100
  01000101001000001110100001111000

  01110110000001001010100110110000
  01100000010100110001010101001000

  00101100001000001001111001011000
  00011000100100101011101101010000
  ```

  Unfortunately, even though this change makes more bits similar on average,
  none of these values' lowest 16 bits match. Now, it's not until the 1056th
  pair that the judge finds the first match:

  ```
  --Gen. A--  --Gen. B--
  1023762912   896885216

  00111101000001010110000111100000
  00110101011101010110000111100000
  ```
  This change makes the generators much slower, and the judge is getting
  impatient; it is now only willing to consider 5 million pairs. (Using the
  values from the example above, after five million pairs, the judge would
  eventually find a total of 309 pairs that match in their lowest 16 bits.)

  After 5 million pairs, but using this new generator logic, what is the judge's final count?

  Although it hasn't changed, you can still get your puzzle input.

  Answer:
   [Submit]

  test with
  ```
  echo "65
  8921" | ruby -e '
      (a, b) = ARGF.read.split("\n").map{|l| l.split.last.to_i }
      puts "a is #{a}\nb is #{b}"
      ...'
  ```

  ```
  cat day15/data.txt | ruby -e '
      (a, b) = ARGF.read.split("\n").map{|l| l.split.last.to_i }
      puts "a is #{a}\nb is #{b}"
      amul = 16807
      bmul = 48271
      remainder = 2147483647
      tot = 0              
      (0..5_000_000).each{ |i|
        loop do; a = (a * amul) % remainder; break  if a % 4 == 0; end;
        loop do; b = (b * bmul) % remainder; break if b % 8 == 0; end;
        #puts [a, b].inspect;
        tot += 1 if ([a].pack("S") == [b].pack("S"))
      }                                            
      puts tot'
  a is 873
  b is 583
  279
  ```

## Day 14

## Day 13

  --- Day 13: Packet Scanners ---

  You need to cross a vast firewall. The firewall consists of several layers,
  each with a security scanner that moves back and forth across the layer. To
  succeed, you must not be detected by a scanner.

  By studying the firewall briefly, you are able to record (in your puzzle
  input) the depth of each layer and the range of the scanning area for the
  scanner within it, written as depth: range. Each layer has a thickness of
  exactly 1. A layer at depth 0 begins immediately inside the firewall; a layer
  at depth 1 would start immediately after that.

  For example, suppose you've recorded the following:

  ```
  0: 3
  1: 2
  4: 4
  6: 4
  ```
  This means that there is a layer immediately inside the firewall (with range
  3), a second layer immediately after that (with range 2), a third layer which
  begins at depth 4 (with range 4), and a fourth layer which begins at depth 6
  (also with range 4). Visually, it might look like this:

  ```
   0   1   2   3   4   5   6
  [ ] [ ] ... ... [ ] ... [ ]
  [ ] [ ]         [ ]     [ ]
  [ ]             [ ]     [ ]
                  [ ]     [ ]
  ```
  Within each layer, a security scanner moves back and forth within its range.
  Each security scanner starts at the top and moves down until it reaches the
  bottom, then moves up until it reaches the top, and repeats. A security
  scanner takes one picosecond to move one step. Drawing scanners as S, the
  first few picoseconds look like this:


  Picosecond 0:
  ```
   0   1   2   3   4   5   6
  [S] [S] ... ... [S] ... [S]
  [ ] [ ]         [ ]     [ ]
  [ ]             [ ]     [ ]
                  [ ]     [ ]
  ```

  Picosecond 1:
  ```
   0   1   2   3   4   5   6
  [ ] [ ] ... ... [ ] ... [ ]
  [S] [S]         [S]     [S]
  [ ]             [ ]     [ ]
                  [ ]     [ ]
  ```

  Picosecond 2:
  ```
   0   1   2   3   4   5   6
  [ ] [S] ... ... [ ] ... [ ]
  [ ] [ ]         [ ]     [ ]
  [S]             [S]     [S]
                  [ ]     [ ]
  ```

  Picosecond 3:
  ```
   0   1   2   3   4   5   6
  [ ] [ ] ... ... [ ] ... [ ]
  [S] [S]         [ ]     [ ]
  [ ]             [ ]     [ ]
                  [S]     [S]
  ```
  Your plan is to hitch a ride on a packet about to move through the firewall.
  The packet will travel along the top of each layer, and it moves at one layer
  per picosecond. Each picosecond, the packet moves one layer forward (its
  first move takes it into layer 0), and then the scanners move one step. If
  there is a scanner at the top of the layer as your packet enters it, you are
  caught. (If a scanner moves into the top of its layer while you are there,
  you are not caught: it doesn't have time to notice you before you leave.) If
  you were to do this in the configuration above, marking your current position
  with parentheses, your passage through the firewall would look like this:

  Initial state:
  ```
   0   1   2   3   4   5   6
  [S] [S] ... ... [S] ... [S]
  [ ] [ ]         [ ]     [ ]
  [ ]             [ ]     [ ]
                  [ ]     [ ]
  ```

  Picosecond 0:
  ```
   0   1   2   3   4   5   6
  (S) [S] ... ... [S] ... [S]
  [ ] [ ]         [ ]     [ ]
  [ ]             [ ]     [ ]
                  [ ]     [ ]

   0   1   2   3   4   5   6
  ( ) [ ] ... ... [ ] ... [ ]
  [S] [S]         [S]     [S]
  [ ]             [ ]     [ ]
                  [ ]     [ ]
  ```


  Picosecond 1:
  ```
   0   1   2   3   4   5   6
  [ ] ( ) ... ... [ ] ... [ ]
  [S] [S]         [S]     [S]
  [ ]             [ ]     [ ]
                  [ ]     [ ]

   0   1   2   3   4   5   6
  [ ] (S) ... ... [ ] ... [ ]
  [ ] [ ]         [ ]     [ ]
  [S]             [S]     [S]
                  [ ]     [ ]
  ```


  Picosecond 2:
  ```
   0   1   2   3   4   5   6
  [ ] [S] (.) ... [ ] ... [ ]
  [ ] [ ]         [ ]     [ ]
  [S]             [S]     [S]
                  [ ]     [ ]

   0   1   2   3   4   5   6
  [ ] [ ] (.) ... [ ] ... [ ]
  [S] [S]         [ ]     [ ]
  [ ]             [ ]     [ ]
                  [S]     [S]

  ```

  Picosecond 3:
  ```
   0   1   2   3   4   5   6
  [ ] [ ] ... (.) [ ] ... [ ]
  [S] [S]         [ ]     [ ]
  [ ]             [ ]     [ ]
                  [S]     [S]

   0   1   2   3   4   5   6
  [S] [S] ... (.) [ ] ... [ ]
  [ ] [ ]         [ ]     [ ]
  [ ]             [S]     [S]
                  [ ]     [ ]
  ```


  Picosecond 4:
  ```
   0   1   2   3   4   5   6
  [S] [S] ... ... ( ) ... [ ]
  [ ] [ ]         [ ]     [ ]
  [ ]             [S]     [S]
                  [ ]     [ ]

   0   1   2   3   4   5   6
  [ ] [ ] ... ... ( ) ... [ ]
  [S] [S]         [S]     [S]
  [ ]             [ ]     [ ]
                  [ ]     [ ]
  ```


  Picosecond 5:
  ```
   0   1   2   3   4   5   6
  [ ] [ ] ... ... [ ] (.) [ ]
  [S] [S]         [S]     [S]
  [ ]             [ ]     [ ]
                  [ ]     [ ]

   0   1   2   3   4   5   6
  [ ] [S] ... ... [S] (.) [S]
  [ ] [ ]         [ ]     [ ]
  [S]             [ ]     [ ]
                  [ ]     [ ]
  ```


  Picosecond 6:
  ```
   0   1   2   3   4   5   6
  [ ] [S] ... ... [S] ... (S)
  [ ] [ ]         [ ]     [ ]
  [S]             [ ]     [ ]
                  [ ]     [ ]

   0   1   2   3   4   5   6
  [ ] [ ] ... ... [ ] ... ( )
  [S] [S]         [S]     [S]
  [ ]             [ ]     [ ]
                  [ ]     [ ]
  ```

  In this situation, you are caught in layers 0 and 6, because your packet
  entered the layer when its scanner was at the top when you entered it. You
  are not caught in layer 1, since the scanner moved into the top of the layer
  once you were already there.

  The severity of getting caught on a layer is equal to its depth multiplied by
  its range. (Ignore layers in which you do not get caught.) The severity of
  the whole trip is the sum of these values. In the example above, the trip
  severity is 0*3 + 6*4 = 24.

  Given the details of the firewall you've recorded, if you leave immediately,
  what is the severity of your whole trip?

  To begin, get your puzzle input.

  ```
  curl 'https://adventofcode.com/2017/day/13/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day13/data.txt
  ```

  ```
  cat day13/data.txt | ruby -e '
    h = ARGF.read.chomp.split("\n").inject({}) {|h,j|
      h.merge Hash[[j.split(": ").map(&:to_i)]]
    }
    caught = (0..h.keys.max)
      .select{|k| h.has_key? k }
      .inject({}) { |cght, c|
        len = h[c] - 1
        pos = c == 0 ? 0 : (c/len).odd? ? len -  (c % len) : (c % len)
        pos == 0 ? cght.merge(Hash[*[c, h[c]]]) : cght
    }
    puts caught.map{|(k,v)| k*v}.sum'

  1528
  ```

  or run `cat day13/data.txt | ruby day13/script.rb`

  -- Part Two ---

  Now, you need to pass through the firewall without being caught - easier said
  than done.

  You can't control the speed of the packet, but you can delay it any number of
  picoseconds. For each picosecond you delay the packet before beginning your
  trip, all security scanners move one step. You're not in the firewall during
  this time; you don't enter layer 0 until you stop delaying the packet.

  In the example above, if you delay 10 picoseconds (picoseconds 0 - 9), you
  won't get caught:

  State after delaying:
  ```
   0   1   2   3   4   5   6
  [ ] [S] ... ... [ ] ... [ ]
  [ ] [ ]         [ ]     [ ]
  [S]             [S]     [S]
                  [ ]     [ ]
  ```

  Picosecond 10:
  ```
   0   1   2   3   4   5   6
  ( ) [S] ... ... [ ] ... [ ]
  [ ] [ ]         [ ]     [ ]
  [S]             [S]     [S]
                  [ ]     [ ]

   0   1   2   3   4   5   6
  ( ) [ ] ... ... [ ] ... [ ]
  [S] [S]         [S]     [S]
  [ ]             [ ]     [ ]
                  [ ]     [ ]
  ```


  Picosecond 11:
  ```
   0   1   2   3   4   5   6
  [ ] ( ) ... ... [ ] ... [ ]
  [S] [S]         [S]     [S]
  [ ]             [ ]     [ ]
                  [ ]     [ ]

   0   1   2   3   4   5   6
  [S] (S) ... ... [S] ... [S]
  [ ] [ ]         [ ]     [ ]
  [ ]             [ ]     [ ]
                  [ ]     [ ]
  ```


  Picosecond 12:
  ```
   0   1   2   3   4   5   6
  [S] [S] (.) ... [S] ... [S]
  [ ] [ ]         [ ]     [ ]
  [ ]             [ ]     [ ]
                  [ ]     [ ]

   0   1   2   3   4   5   6
  [ ] [ ] (.) ... [ ] ... [ ]
  [S] [S]         [S]     [S]
  [ ]             [ ]     [ ]
                  [ ]     [ ]
  ```


  Picosecond 13:
  ```
   0   1   2   3   4   5   6
  [ ] [ ] ... (.) [ ] ... [ ]
  [S] [S]         [S]     [S]
  [ ]             [ ]     [ ]
                  [ ]     [ ]

   0   1   2   3   4   5   6
  [ ] [S] ... (.) [ ] ... [ ]
  [ ] [ ]         [ ]     [ ]
  [S]             [S]     [S]
                  [ ]     [ ]
  ```


  Picosecond 14:
  ```
   0   1   2   3   4   5   6
  [ ] [S] ... ... ( ) ... [ ]
  [ ] [ ]         [ ]     [ ]
  [S]             [S]     [S]
                  [ ]     [ ]

   0   1   2   3   4   5   6
  [ ] [ ] ... ... ( ) ... [ ]
  [S] [S]         [ ]     [ ]
  [ ]             [ ]     [ ]
                  [S]     [S]
  ```


  Picosecond 15:
  ```
   0   1   2   3   4   5   6
  [ ] [ ] ... ... [ ] (.) [ ]
  [S] [S]         [ ]     [ ]
  [ ]             [ ]     [ ]
                  [S]     [S]

   0   1   2   3   4   5   6
  [S] [S] ... ... [ ] (.) [ ]
  [ ] [ ]         [ ]     [ ]
  [ ]             [S]     [S]
                  [ ]     [ ]
  ```


  Picosecond 16:
  ```
   0   1   2   3   4   5   6
  [S] [S] ... ... [ ] ... ( )
  [ ] [ ]         [ ]     [ ]
  [ ]             [S]     [S]
                  [ ]     [ ]

   0   1   2   3   4   5   6
  [ ] [ ] ... ... [ ] ... ( )
  [S] [S]         [S]     [S]
  [ ]             [ ]     [ ]
                  [ ]     [ ]
  ```

  Because all smaller delays would get you caught, the fewest number of
  picoseconds you would need to delay to get through safely is 10.

  What is the fewest number of picoseconds that you need to delay the packet to
  pass through the firewall without being caught?

  ```
  cat day13/data.txt | ruby day13/script.rb                                                                                                                                        

  3896406
  ```                                                                                                                                                                              

## Day 12

  --- Day 12: Digital Plumber ---

  Walking along the memory banks of the stream, you find a small village that
  is experiencing a little confusion: some programs can't communicate with each
  other.

  Programs in this village communicate using a fixed system of pipes. Messages
  are passed between programs using these pipes, but most programs aren't
  connected to each other directly. Instead, programs pass messages between
  each other until the message reaches the intended recipient.

  For some reason, though, some of these messages aren't ever reaching their
  intended recipient, and the programs suspect that some pipes are missing.
  They would like you to investigate.

  You walk through the village and record the ID of each program and the IDs
  with which it can communicate directly (your puzzle input). Each program has
  one or more programs with which it can communicate, and these pipes are
  bidirectional; if 8 says it can communicate with 11, then 11 will say it can
  communicate with 8.

  You need to figure out how many programs are in the group that contains
  program ID 0.

  For example, suppose you go door-to-door like a travelling salesman and
  record the following list:

  ```
  0 <-> 2
  1 <-> 1
  2 <-> 0, 3, 4
  3 <-> 2, 4
  4 <-> 2, 3, 6
  5 <-> 6
  6 <-> 4, 5
  ```

  In this example, the following programs are in the group that contains program ID 0:

  ```
  Program 0 by definition.
  Program 2, directly connected to program 0.
  Program 3 via program 2.
  Program 4 via program 2.
  Program 5 via programs 6, then 4, then 2.
  Program 6 via programs 4, then 2.
  ```

  Therefore, a total of 6 programs are in this group; all but program 1, which
  has a pipe that connects it to itself.

  How many programs are in the group that contains program ID 0?

  To begin, get your puzzle input.

  ```
  curl 'https://adventofcode.com/2017/day/12/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day12/data.txt
  ```

## Day 11

  --- Day 11: Hex Ed ---

  Crossing the bridge, you've barely reached the other side of the stream when
  a program comes up to you, clearly in distress. "It's my child process," she
  says, "he's gotten lost in an infinite grid!"

  Fortunately for her, you have plenty of experience with infinite grids.

  Unfortunately for you, it's a hex grid.

  The hexagons ("hexes") in this grid are aligned such that adjacent hexes can
  be found to the north, northeast, southeast, south, southwest, and northwest:

  ```
    \ n  /
  nw +--+ ne
    /    \
  -+      +-
    \    /
  sw +--+ se
    / s  \
  ```

  You have the path the child process took. Starting where he started, you need
  to determine the fewest number of steps required to reach him. (A "step"
  means to move from the hex you are in to any adjacent hex.)

  For example:

  ne,ne,ne is 3 steps away.
  ne,ne,sw,sw is 0 steps away (back where you started).
  ne,ne,s,s is 2 steps away (se,se).
  se,sw,se,sw,sw is 3 steps away (s,s,sw).

  ```
  curl 'http://adventofcode.com/2017/day/11/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day11/data.txt
  ```

  ```
  cat data.txt | ruby -I lib -e 'require "map_cancel"; puts MapCancel.new(ARGF.read.chomp).steps'
  784
  ```

  --- Part Two ---

  How many steps away is the furthest he ever got from his starting position?


  ```
  cat data.txt | ruby -I lib -e 'require "map_cancel"; puts MapCancel.new(ARGF.read.chomp).max_steps'
  1558
  ```

## Day 10

  --- Day 10: Knot Hash ---

  You come across some programs that are trying to implement a software
  emulation of a hash based on knot-tying. The hash these programs are
  implementing isn't very strong, but you decide to help them anyway. You make
  a mental note to remind the Elves later not to invent their own cryptographic
  functions.

  This hash function simulates tying a knot in a circle of string with 256
  marks on it. Based on the input to be hashed, the function repeatedly selects
  a span of string, brings the ends together, and gives the span a half-twist
  to reverse the order of the marks within it. After doing this many times, the
  order of the marks is used to build the resulting hash.

    4--5   pinch   4  5           4   1
   /    \  5,0,1  / \/ \  twist  / \ / \
  3      0  -->  3      0  -->  3   X   0
   \    /         \ /\ /         \ / \ /
    2--1           2  1           2   5
  To achieve this, begin with a list of numbers from 0 to 255, a current
  position which begins at 0 (the first element in the list), a skip size
  (which starts at 0), and a sequence of lengths (your puzzle input). Then, for
  each length:

  Reverse the order of that length of elements in the list, starting with the
  element at the current position.
  Move the current position forward by that length plus the skip size.
  Increase the skip size by one.
  The list is circular; if the current position and the length try to reverse
  elements beyond the end of the list, the operation reverses using as many
  extra elements as it needs from the front of the list. If the current
  position moves past the end of the list, it wraps around to the front.
  Lengths larger than the size of the list are invalid.

  Here's an example using a smaller list:

  Suppose we instead only had a circular list containing five elements, 0, 1,
  2, 3, 4, and were given input lengths of 3, 4, 1, 5.

  The list begins as [0] 1 2 3 4 (where square brackets indicate the current position).
  The first length, 3, selects ([0] 1 2) 3 4 (where parentheses indicate the sublist to be reversed).
  After reversing that section (0 1 2 into 2 1 0), we get ([2] 1 0) 3 4.
  Then, the current position moves forward by the length, 3, plus the skip size, 0: 2 1 0 [3] 4. Finally, the skip size increases to 1.
  The second length, 4, selects a section which wraps: 2 1) 0 ([3] 4.
  The sublist 3 4 2 1 is reversed to form 1 2 4 3: 4 3) 0 ([1] 2.
  The current position moves forward by the length plus the skip size, a total of 5, causing it not to move because it wraps around: 4 3 0 [1] 2. The skip size increases to 2.
  The third length, 1, selects a sublist of a single element, and so reversing it has no effect.
  The current position moves forward by the length (1) plus the skip size (2): 4 [3] 0 1 2. The skip size increases to 3.
  The fourth length, 5, selects every element starting with the second: 4) ([3] 0 1 2. Reversing this sublist (3 0 1 2 4 into 4 2 1 0 3) produces: 3) ([4] 2 1 0.
  Finally, the current position moves forward by 8: 3 4 2 1 [0]. The skip size increases to 4.
  In this example, the first two numbers in the list end up being 3 and 4; to check the process, you can multiply them together to produce 12.

  However, you should instead use the standard list size of 256 (with values 0
  to 255) and the sequence of lengths in your puzzle input. Once this process
  is complete, what is the result of multiplying the first two numbers in the
  list?

  Your puzzle answer was 29240.

  ```
  echo '3,4,1,5' | ruby -e '
  list = (0..4).to_a;
  lengths = ARGF.read.split(",").map(&:to_i);
  ssize = 0;
  index = 0;
  lengths.each{|l|
    sub = [list, list].flatten.slice(index, l).reverse;
    puts sub.inspect;
    puts list.inspect;
    sub.each_with_index{|s,i| list[(index + i)%list.length] = s};
    index = (index + l + ssize)%list.length;
    ssize += 1;
  };
  puts list.inspect;
  puts lengths.inspect;
  puts "";
  puts list[0] * list[1]'
  ```

  ```
  cat day10/data.txt | ruby -e '
  list = (0..255).to_a;
  lengths = ARGF.read.split(",").map(&:to_i);
  ssize = 0;
  index = 0;
  lengths.each{|l|
    sub = [list, list].flatten.slice(index, l).reverse;
    sub.each_with_index{|s,i| list[(index + i)%list.length] = s};
    index = (index + l + ssize)%list.length;
    ssize += 1;
  };
  puts list[0] * list[1]'

  29240
  ```

  --- Part Two ---

  The logic you've constructed forms a single round of the Knot Hash algorithm;
  running the full thing requires many of these rounds. Some input and output
  processing is also required.

  First, from now on, your input should be taken not as a list of numbers, but
  as a string of bytes instead. Unless otherwise specified, convert characters
  to bytes using their ASCII codes. This will allow you to handle arbitrary
  ASCII strings, and it also ensures that your input lengths are never larger
  than 255. For example, if you are given 1,2,3, you should convert it to the
  ASCII codes for each character: 49,44,50,44,51.

  Once you have determined the sequence of lengths to use, add the following
  lengths to the end of the sequence: 17, 31, 73, 47, 23. For example, if you
  are given 1,2,3, your final sequence of lengths should be
  49,44,50,44,51,17,31,73,47,23 (the ASCII codes from the input string combined
  with the standard length suffix values).

  Second, instead of merely running one round like you did above, run a total
  of 64 rounds, using the same length sequence in each round. The current
  position and skip size should be preserved between rounds. For example, if
  the previous example was your first round, you would start your second round
  with the same length sequence (3, 4, 1, 5, 17, 31, 73, 47, 23, now assuming
  they came from ASCII codes and include the suffix), but start with the
  previous round's current position (4) and skip size (4).

  Once the rounds are complete, you will be left with the numbers from 0 to 255
  in some order, called the sparse hash. Your next task is to reduce these to a
  list of only 16 numbers called the dense hash. To do this, use numeric
  bitwise XOR to combine each consecutive block of 16 numbers in the sparse
  hash (there are 16 such blocks in a list of 256 numbers). So, the first
  element in the dense hash is the first sixteen elements of the sparse hash
  XOR'd together, the second element in the dense hash is the second sixteen
  elements of the sparse hash XOR'd together, etc.

  For example, if the first sixteen elements of your sparse hash are as shown
  below, and the XOR operator is ^, you would calculate the first output number
  like this:

  65 ^ 27 ^ 9 ^ 1 ^ 4 ^ 3 ^ 40 ^ 50 ^ 91 ^ 7 ^ 6 ^ 0 ^ 2 ^ 5 ^ 68 ^ 22 = 64
  Perform this operation on each of the sixteen blocks of sixteen numbers in
  your sparse hash to determine the sixteen numbers in your dense hash.

  Finally, the standard way to represent a Knot Hash is as a single hexadecimal
  string; the final output is the dense hash in hexadecimal notation. Because
  each number in your dense hash will be between 0 and 255 (inclusive), always
  represent each number as two hexadecimal digits (including a leading zero as
  necessary). So, if your first three numbers are 64, 7, 255, they correspond
  to the hexadecimal numbers 40, 07, ff, and so the first six characters of the
  hash would be 4007ff. Because every Knot Hash is sixteen such numbers, the
  hexadecimal representation is always 32 hexadecimal digits (0-f) long.

  Here are some example hashes:

  The empty string becomes a2582a3a0e66e6e86e3812dcb672a272.
  AoC 2017 becomes 33efeb34ea91902bb2f59c9920caa6cd.
  1,2,3 becomes 3efbe78a8d82f29979031a4aa0b16a9d.
  1,2,4 becomes 63960835bcdc130f0b66d7ff4f6a5a8e.
  Treating your puzzle input as a string of ASCII characters, what is the Knot Hash of your puzzle input? Ignore any leading or trailing whitespace you might encounter.

  Although it hasn't changed, you can still get your puzzle input.

  Answer: `4db3799145278dc9f73dcdbc680bd53d`

  ```
  echo '76,1,88,148,166,217,130,0,128,254,16,2,130,71,255,229'  | ruby -e '
  list = (0..255).to_a; mlengths = [];
  ARGF.read.chomp.each_byte{|b| mlengths << b};
  mlengths = [mlengths,  [17, 31, 73, 47,23]].flatten; ssize = 0;
  index = 0; (1..64).each{|round|
  lengths = mlengths; lengths.each{|l|
    sub = [list, list].flatten.slice(index, l).reverse;
    sub.each_with_index{|s,i| list[(index + i)%list.length] = s};
    index = (index + l + ssize)%list.length;
    ssize += 1;
  };};
  puts (0..list.length-1).step(16).map{|i| "%02x" % list.slice(i, 16).reduce(:^) }.join'

  4db3799145278dc9f73dcdbc680bd53d
  ```

## Day 9

  --- Day 9: Stream Processing ---

  A large stream blocks your path. According to the locals, it's not safe to
  cross the stream at the moment because it's full of garbage. You look down at
  the stream; rather than water, you discover that it's a stream of characters.

  You sit for a while and record part of the stream (your puzzle input). The
  characters represent groups - sequences that begin with { and end with }.
  Within a group, there are zero or more other things, separated by commas:
  either another group or garbage. Since groups can contain other groups, a }
  only closes the most-recently-opened unclosed group - that is, they are
  nestable. Your puzzle input represents a single, large group which itself
  contains many smaller ones.

  Sometimes, instead of a group, you will find garbage. Garbage begins with <
  and ends with >. Between those angle brackets, almost any character can
  appear, including { and }. Within garbage, < has no special meaning.

  In a futile attempt to clean up the garbage, some program has canceled some
  of the characters within it using !: inside garbage, any character that comes
  after ! should be ignored, including <, >, and even another !.

  You don't see any characters that deviate from these rules. Outside garbage,
  you only find well-formed groups, and garbage always terminates according to
  the rules above.

  Here are some self-contained pieces of garbage:

  <>, empty garbage.
  <random characters>, garbage containing random characters.
  <<<<>, because the extra < are ignored.
  <{!>}>, because the first > is canceled.
  <!!>, because the second ! is canceled, allowing the > to terminate the garbage.
  <!!!>>, because the second ! and the first > are canceled.
  <{o"i!a,<{i<a>, which ends at the first >.
  Here are some examples of whole streams and the number of groups they contain:

  {}, 1 group.
  {{{}}}, 3 groups.
  {{},{}}, also 3 groups.
  {{{},{},{{}}}}, 6 groups.
  {<{},{},{{}}>}, 1 group (which itself contains garbage).
  {<a>,<a>,<a>,<a>}, 1 group.
  {{<a>},{<a>},{<a>},{<a>}}, 5 groups.
  {{<!>},{<!>},{<!>},{<a>}}, 2 groups (since all but the last > are canceled).
  Your goal is to find the total score for all groups in your input. Each group
  is assigned a score which is one more than the score of the group that
  immediately contains it. (The outermost group gets a score of 1.)

  {}, score of 1.
  {{{}}}, score of 1 + 2 + 3 = 6.
  {{},{}}, score of 1 + 2 + 2 = 5.
  {{{},{},{{}}}}, score of 1 + 2 + 3 + 3 + 3 + 4 = 16.
  {<a>,<a>,<a>,<a>}, score of 1.
  {{<ab>},{<ab>},{<ab>},{<ab>}}, score of 1 + 2 + 2 + 2 + 2 = 9.
  {{<!!>},{<!!>},{<!!>},{<!!>}}, score of 1 + 2 + 2 + 2 + 2 = 9.
  {{<a!>},{<a!>},{<a!>},{<ab>}}, score of 1 + 2 = 3.
  What is the total score for all groups in your input?

  ```
  curl 'http://adventofcode.com/2017/day/9/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day9/data.txt
  ```

  ```
  cd day9
  rspec
  cat data.txt | ruby -I lib -e 'require "parser"; puts Parser.new(ARGF.read).score'
  14190
  ```

  Your puzzle answer was 14190.

  The first half of this puzzle is complete! It provides one gold star: *

  --- Part Two ---

  Now, you're ready to remove the garbage.

  To prove you've removed it, you need to count all of the characters within
  the garbage. The leading and trailing < and > don't count, nor do any
  canceled characters or the ! doing the canceling.

  <>, 0 characters.
  <random characters>, 17 characters.
  <<<<>, 3 characters.
  <{!>}>, 2 characters.
  <!!>, 0 characters.
  <!!!>>, 0 characters.
  <{o"i!a,<{i<a>, 10 characters.
  How many non-canceled characters are within the garbage in your puzzle input?

  Although it hasn't changed, you can still get your puzzle input. 

  ```
  cat data.txt | ruby -I lib -e 'require "parser"; puts Parser.new(ARGF.read).count'
  7053
  ```

## Day 8

  --- Day 8: I Heard You Like Registers ---

  You receive a signal directly from the CPU. Because of your recent assistance
  with jump instructions, it would like you to compute the result of a series
  of unusual register instructions.

  Each instruction consists of several parts: the register to modify, whether
  to increase or decrease that register's value, the amount by which to
  increase or decrease it, and a condition. If the condition fails, skip the
  instruction without modifying the register. The registers all start at 0. The
  instructions look like this:

  ```
  b inc 5 if a > 1
  a inc 1 if b < 5
  c dec -10 if a >= 1
  c inc -20 if c == 10
  ```
  These instructions would be processed as follows:

  ```
  Because a starts at 0, it is not greater than 1, and so b is not modified.
  a is increased by 1 (to 1) because b is less than 5 (it is 0).
  c is decreased by -10 (to 10) because a is now greater than or equal to 1 (it is 1).
  c is increased by -20 (to -10) because c is equal to 10.
  After this process, the largest value in any register is 1.
  ```

  You might also encounter <= (less than or equal to) or != (not equal to).
  However, the CPU doesn't have the bandwidth to tell you what all the
  registers are named, and leaves that to you to determine.

  What is the largest value in any register after completing the instructions
  in your puzzle input?

  To begin, get your puzzle input. 

  ```
  curl 'http://adventofcode.com/2017/day/8/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day8/data.txt
  ```

  ```
  cat  day8/data.txt  | ruby -e 'regs = {}; ARGF.read.split("\n").each{|l| (reg, inc, val, _if, o_reg, op, o_val) = l.split; regs[reg] ||= 0; regs[o_reg] ||= 0; if(eval("regs[o_reg] #{op} o_val.to_i")); if(inc == "inc"); regs[reg] += val.to_i; else; regs[reg] -= val.to_i; end; end;}; puts regs.values.max.inspect'
  6061
  ```

  --- Part Two ---

  To be safe, the CPU also needs to know the highest value held in any register
  during this process so that it can decide how much memory to allocate to
  these operations. For example, in the above instructions, the highest value
  ever held was 10 (in register c after the third instruction was evaluated).

  ```
  cat  day8/data.txt | ruby -e '
    regs = {}
    max = 0
    ARGF.read.split("\n").each{ |l|
      (reg, inc, val, _if, o_reg, op, o_val) = l.split
      regs[reg] ||= 0
      regs[o_reg] ||= 0
      if (eval("regs[o_reg] #{op} o_val.to_i"))
        if(inc == "inc")
          regs[reg] += val.to_i
        else
          regs[reg] -= val.to_i
        end
      end
      max = [max, regs.values.max].max
    }
    puts regs.values.max.inspect
    puts max'

  6061
  6696
  ```

## Day 7

  --- Day 7: Recursive Circus ---

  Wandering further through the circuits of the computer, you come upon a tower
  of programs that have gotten themselves into a bit of trouble. A recursive
  algorithm has gotten out of hand, and now they're balanced precariously in a
  large tower.

  One program at the bottom supports the entire tower. It's holding a large
  disc, and on the disc are balanced several more sub-towers. At the bottom of
  these sub-towers, standing on the bottom disc, are other programs, each
  holding their own disc, and so on. At the very tops of these
  sub-sub-sub-...-towers, many programs stand simply keeping the disc below
  them balanced but with no disc of their own.

  You offer to help, but first you need to understand the structure of these
  towers. You ask each program to yell out their name, their weight, and (if
  they're holding a disc) the names of the programs immediately above them
  balancing on that disc. You write this information down (your puzzle input).
  Unfortunately, in their panic, they don't do this in an orderly fashion; by
  the time you're done, you're not sure which program gave which information.

  For example, if your list is the following:

  pbga (66)
  xhth (57)
  ebii (61)
  havc (66)
  ktlj (57)
  fwft (72) -> ktlj, cntj, xhth
  qoyq (66)
  padx (45) -> pbga, havc, qoyq
  tknk (41) -> ugml, padx, fwft
  jptl (61)
  ugml (68) -> gyxo, ebii, jptl
  gyxo (61)
  cntj (57)
  ...then you would be able to recreate the structure of the towers that looks like this:

                  gyxo
                /    
           ugml - ebii
         /      \    
        |         jptl
        |       
        |         pbga
       /        /
  tknk --- padx - havc
       \        \
        |         qoyq
        |            
        |         ktlj
         \      /    
           fwft - cntj
                \    
                  xhth
  In this example, tknk is at the bottom of the tower (the bottom program), and
  is holding up ugml, padx, and fwft. Those programs are, in turn, holding up
  other programs; in this example, none of those programs are holding up any
  other programs, and are all the tops of their own towers. (The actual tower
  balancing in front of you is much larger.)

  Before you're ready to help them, you need to make sure your information is
  correct. What is the name of the bottom program?

  ```
  curl 'http://adventofcode.com/2017/day/7/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day7/data.txt
  ```

  ```
  cat day7/data.txt | ruby -e 'tree = {}; ARGF.read.split("\n").map{|l| tree[l.split.first] = l.split(" -> ")[1].split(", ") rescue [];}; root =  tree.keys.uniq.sort - tree.values.flatten.uniq.sort; puts root.first'
  xegshds
  ```

  Your puzzle answer was xegshds.

  The first half of this puzzle is complete! It provides one gold star: *

  --- Part Two ---

  The programs explain the situation: they can't get down. Rather, they could
  get down, if they weren't expending all of their energy trying to keep the
  tower balanced. Apparently, one program has the wrong weight, and until it's
  fixed, they're stuck here.

  For any program holding a disc, each program standing on that disc forms a
  sub-tower. Each of those sub-towers are supposed to be the same weight, or
  the disc itself isn't balanced. The weight of a tower is the sum of the
  weights of the programs in that tower.

  In the example above, this means that for ugml's disc to be balanced, gyxo,
  ebii, and jptl must all have the same weight, and they do: 61.

  However, for tknk to be balanced, each of the programs standing on its disc
  and all programs above it must each match. This means that the following sums
  must all be the same:

  ugml + (gyxo + ebii + jptl) = 68 + (61 + 61 + 61) = 251
  padx + (pbga + havc + qoyq) = 45 + (66 + 66 + 66) = 243
  fwft + (ktlj + cntj + xhth) = 72 + (57 + 57 + 57) = 243
  As you can see, tknk's disc is unbalanced: ugml's stack is heavier than the
  other two. Even though the nodes above ugml are balanced, ugml itself is too
  heavy: it needs to be 8 units lighter for its stack to weigh 243 and keep the
  towers balanced. If this change were made, its weight would be 60.

  Given that exactly one program is the wrong weight, what would its weight
  need to be to balance the entire tower?

  Although it hasn't changed, you can still get your puzzle input.

  ```
  cat day7/data.txt | ruby day7/script.rb
  cat data.txt | ruby  script.rb
  1
  xegshds
  branches with uneven weights
  ["fabacam", 776]
  for values [770, 770, 776]
  {:branches=>["dlcxjg", "dlactl", "falrf"], :value=>305}
  ["anygv", 5994]
  for values [5988, 5988, 5994, 5988, 5988, 5988]
  {:branches=>["tghfe", "ybzqi", "fabacam"], :value=>3678}
  ["ggxgmci", 101997]
  for values [101991, 101991, 101997, 101991, 101991]
  {:branches=>["nsvan", "qcbfbfz", "anygv", "gefrwix", "kkeafw", "jepbpw"], :value=>66063}
  ```

  fabacam is out as 776 for it's branch so it needs 6 less so `305 - 6 = 299`

  ...

## Day 6

  --- Day 6: Memory Reallocation ---

  A debugger program here is having an issue: it is trying to repair a memory
  reallocation routine, but it keeps getting stuck in an infinite loop.

  In this area, there are sixteen memory banks; each memory bank can hold any
  number of blocks. The goal of the reallocation routine is to balance the
  blocks between the memory banks.

  The reallocation routine operates in cycles. In each cycle, it finds the
  memory bank with the most blocks (ties won by the lowest-numbered memory
  bank) and redistributes those blocks among the banks. To do this, it removes
  all of the blocks from the selected bank, then moves to the next (by index)
  memory bank and inserts one of the blocks. It continues doing this until it
  runs out of blocks; if it reaches the last memory bank, it wraps around to
  the first one.

  The debugger would like to know how many redistributions can be done before a
  blocks-in-banks configuration is produced that has been seen before.

  For example, imagine a scenario with only four memory banks:

    - The banks start with 0, 2, 7, and 0 blocks. The third bank has the most
      blocks, so it is chosen for redistribution.
    - Starting with the next bank (the fourth bank) and then continuing to the
      first bank, the second bank, and so on, the 7 blocks are spread out over
      the memory banks. The fourth, first, and second banks get two blocks
      each, and the third bank gets one back. The final result looks like this:
      2 4 1 2.
    - Next, the second bank is chosen because it contains the most blocks
      (four). Because there are four memory banks, each gets one block. The
      result is: 3 1 2 3.
    - Now, there is a tie between the first and fourth memory banks, both of
      which have three blocks. The first bank wins the tie, and its three
      blocks are distributed evenly over the other three banks, leaving it with
      none: 0 2 3 4.
    - The fourth bank is chosen, and its four blocks are distributed such that
      each of the four banks receives one: 1 3 4 1.
    - The third bank is chosen, and the same thing happens: 2 4 1 2.
    - At this point, we've reached a state we've seen before: 2 4 1 2 was
      already seen. The infinite loop is detected after the fifth block
      redistribution cycle, and so the answer in this example is 5.

  Given the initial block counts in your puzzle input, how many redistribution
  cycles must be completed before a configuration is produced that has been
  seen before?

  To begin, get your puzzle input.

  ```
  curl 'http://adventofcode.com/2017/day/6/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day6/data.txt
  ```

  demo

  ```
  echo "0       2       7       0" | ruby -e 'prev = []; input = ARGF.read.split("\t").map(&:to_i); count = 0; loop do; count += 1; prev << input.clone; index = input.index(input.max); redis = input[index]; input[index] = 0; while(redis > 0) do; index = (index + 1) % input.length; input[index] += 1; redis -= 1; end; break if prev.select{|a| a == prev.last}.count == 2; end; puts count - 1; puts prev.length - prev.index(prev.last.clone) - 1'
  5
  4
  ```

  answer for part 1 and 2

  ```
  cat day6/data.txt | ruby -e 'prev = []; input = ARGF.read.split("\t").map(&:to_i); count = 0; loop do; count += 1; prev << input.clone; index = input.index(input.max); redis = input[index]; input[index] = 0; while(redis > 0) do; index = (index + 1) % input.length; input[index] += 1; redis -= 1; end; break if prev.select{|a| a == prev.last}.count == 2; end; puts count - 1; puts prev.length - prev.index(prev.last.clone) - 1'
  12841
  8038
  ```

  --- Part Two ---

  Out of curiosity, the debugger would also like to know the size of the loop:
  starting from a state that has already been seen, how many block
  redistribution cycles must be performed before that same state is seen again?

  In the example above, 2 4 1 2 is seen again after four cycles, and so the
  answer in that example would be 4.

  How many cycles are in the infinite loop that arises from the configuration
  in your puzzle input?

  Your puzzle answer was 8038.

## Day 5

  --- Day 5: A Maze of Twisty Trampolines, All Alike ---

  An urgent interrupt arrives from the CPU: it's trapped in a maze of jump
  instructions, and it would like assistance from any programs with spare
  cycles to help find the exit.

  The message includes a list of the offsets for each jump. Jumps are relative:
  -1 moves to the previous instruction, and 2 skips the next one. Start at the
  first instruction in the list. The goal is to follow the jumps until one
  leads outside the list.

  In addition, these instructions are a little strange; after each jump, the
  offset of that instruction increases by 1. So, if you come across an offset
  of 3, you would move three instructions forward, but change it to a 4 for the
  next time it is encountered.

  For example, consider the following list of jump offsets:

  0
  3
  0
  1
  -3
  Positive jumps ("forward") move downward; negative jumps move upward. For
  legibility in this example, these offset values will be written all on one
  line, with the current instruction marked in parentheses. The following steps
  would be taken before an exit is found:

  (0) 3  0  1  -3  - before we have taken any steps.
  (1) 3  0  1  -3  - jump with offset 0 (that is, don't jump at all). Fortunately, the instruction is then incremented to 1.
   2 (3) 0  1  -3  - step forward because of the instruction we just modified. The first instruction is incremented again, now to 2.
   2  4  0  1 (-3) - jump all the way to the end; leave a 4 behind.
   2 (4) 0  1  -2  - go back to where we just were; increment -3 to -2.
   2  5  0  1  -2  - jump 4 steps forward, escaping the maze.
  In this example, the exit is reached in 5 steps.

  How many steps does it take to reach the exit?

  ```
  $ cat day5/data.txt | ruby -e 'instructions = ARGF.read.split("\n").map(&:to_i); sum = 0; index = 0; while(index < instructions.count) do; inst = instructions[index]; instructions[index] += 1; index += inst; sum += 1; end; puts sum;'
  378980
  ```

  Your puzzle answer was 378980.

  --- Part Two ---

  Now, the jumps are even stranger: after each jump, if the offset was three or
  more, instead decrease it by 1. Otherwise, increase it by 1 as before.

  Using this rule with the above example, the process now takes 10 steps, and
  the offset values after finding the exit are left as 2 3 2 3 -1.

  How many steps does it now take to reach the exit?


  ```
  $ cat day5/data.txt | ruby -e 'instructions = ARGF.read.split("\n").map(&:to_i); sum = 0; index = 0; while(index < instructions.count) do; inst = instructions[index]; instructions[index] += inst >= 3 ? -1 : 1; index += inst; sum += 1; end; puts sum;'
  26889114
  ```

  Your puzzle answer was 26889114.

## Day 4

  --- Day 4: High-Entropy Passphrases ---

  A new system policy has been put in place that requires all accounts to use a
  passphrase instead of simply a password. A passphrase consists of a series of
  words (lowercase letters) separated by spaces.

  To ensure security, a valid passphrase must contain no duplicate words.

  For example:

  aa bb cc dd ee is valid.
  aa bb cc dd aa is not valid - the word aa appears more than once.
  aa bb cc dd aaa is valid - aa and aaa count as different words.

  The system's full passphrase list is available as your puzzle input. How many
  passphrases are valid?

  ```
  curl 'http://adventofcode.com/2017/day/4/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day4/data.txt
  ```

  solution
  ```
  $ cat day4/data.txt | ruby -e 'puts ARGF.read.split("\n").map{|l| words = l.split; words.count == words.uniq.count ? 1 : 0}.reduce(&:+)'
  383
  ```

  --- Part Two ---

  For added security, yet another system policy has been put in place. Now, a
  valid passphrase must contain no two words that are anagrams of each other -
  that is, a passphrase is invalid if any word's letters can be rearranged to
  form any other word in the passphrase.

  For example:

  abcde fghij is a valid passphrase.
  abcde xyz ecdab is not valid - the letters from the third word can be rearranged to form the first word.
  a ab abc abd abf abj is a valid passphrase, because all letters need to be used when forming another word.
  iiii oiii ooii oooi oooo is valid.
  oiii ioii iioi iiio is not valid - any of these words can be rearranged to form any other word.

  Under this new system policy, how many passphrases are valid?

## Day 3
  --- Day 3: Spiral Memory ---

  You come across an experimental new kind of memory stored on an infinite
  two-dimensional grid.

  Each square on the grid is allocated in a spiral pattern starting at a
  location marked 1 and then counting up while spiraling outward. For example,
  the first few squares are allocated like this:

  17  16  15  14  13
  18   5   4   3  12
  19   6   1   2  11
  20   7   8   9  10
  21  22  23---> ...
  While this is very space-efficient (no squares are skipped), requested data
  must be carried back to square 1 (the location of the only access port for
  this memory system) by programs that can only move up, down, left, or right.
  They always take the shortest path: the Manhattan Distance between the
  location of the data and square 1.

  For example:

  Data from square 1 is carried 0 steps, since it's at the access port.
  Data from square 12 is carried 3 steps, such as: down, left, left.
  Data from square 23 is carried only 2 steps: up twice.
  Data from square 1024 must be carried 31 steps.
  How many steps are required to carry the data from the square identified in
  your puzzle input all the way to the access port?

  Your puzzle input is 289326.

  ```
  echo 289326 | ruby -e 'number = ARGF.read.to_i; sqrt_whole = Math.sqrt(number).ceil; square_max = sqrt_whole**2; diff = square_max - number; puts sqrt_whole - diff - 1'
  419
  ```

  --- Part Two ---

  As a stress test on the system, the programs here clear the grid and then
  store the value 1 in square 1. Then, in the same allocation order as shown
  above, they store the sum of the values in all adjacent squares, including
  diagonals.

  So, the first few squares' values are chosen as follows:

  Square 1 starts with the value 1.
  Square 2 has only one adjacent filled square (with value 1), so it also stores 1.
  Square 3 has both of the above squares as neighbors and stores the sum of their values, 2.
  Square 4 has all three of the aforementioned squares as neighbors and stores the sum of their values, 4.
  Square 5 only has the first and fourth squares as neighbors, so it gets the value 5.
  Once a square is written, its value does not change. Therefore, the first few squares would receive the following values:

  147  142  133  122   59
  304    5    4    2   57
  330   10    1    1   54
  351   11   23   25   26
  362  747  806--->   ...
  What is the first value written that is larger than your puzzle input?

  Your puzzle input is still 289326.

  taking a WIP approach to actually print this out and then change to do the calculation

  for 60 numbers got `295229`

  ```
   ruby -I lib -e 'require "spiral"; number = 60; spiral = Spiral.new(number); spiral.pretty_print(ary: spiral.adjacent_sums)'
     0      0      0      0      0 295229 279138 266330 130654
     0   6591   6444   6155   5733   5336   5022   2450 128204
     0  13486    147    142    133    122     59   2391 123363
     0  14267    304      5      4      2     57   2275 116247
     0  15252    330     10      1      1     54   2105 109476
     0  16295    351     11     23     25     26   1968 103128
     0  17008    362    747    806    880    931    957  98098
     0  17370  35487  37402  39835  42452  45220  47108  48065
     0      0      0      0      0      0      0      0      0
  ```

  ```
  ruby -I lib -e 'require "spiral"; number = 1000; Spiral.new(number).show.each{|l| puts l.map{|d| sprintf("%#{number.to_s.chars.length}d", d)}.join(", ") }'
  ```

## Day 2

  The spreadsheet consists of rows of apparently-random numbers. To make sure
  the recovery process is on the right track, they need you to calculate the
  spreadsheet's checksum. For each row, determine the difference between the
  largest value and the smallest value; the checksum is the sum of all of these
  differences.

  For example, given the following spreadsheet:

  5 1 9 5
  7 5 3
  2 4 6 8
  The first row's largest and smallest values are 9 and 1, and their difference is 8.
  The second row's largest and smallest values are 7 and 3, and their difference is 4.
  The third row's difference is 6.
  In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18.

  What is the checksum for the spreadsheet in your puzzle input?

  ```
  cat day2/data.txt | ruby -e 'sum = 0; ARGF.read.split("\n").map{|l| digits = l.split.map(&:to_i); sum += digits.max - digits.min}; puts sum'
  41919

  # or
  $ cat day2/data.txt | ruby day2/day_2.rb
  41919
  ```

  --- Part Two ---

  "Great work; looks like we're on the right track after all. Here's a star for
  your effort." However, the program seems a little worried. Can programs be
  worried?

  "Based on what we're seeing, it looks like all the User wanted is some
  information about the evenly divisible values in the spreadsheet.
  Unfortunately, none of us are equipped for that kind of calculation - most of
  us specialize in bitwise operations."

  It sounds like the goal is to find the only two numbers in each row where one
  evenly divides the other - that is, where the result of the division
  operation is a whole number. They would like you to find those numbers on
  each line, divide them, and add up each line's result.

  For example, given the following spreadsheet:

  5 9 2 8
  9 4 7 3
  3 8 6 5
  In the first row, the only two numbers that evenly divide are 8 and 2; the result of this division is 4.
  In the second row, the two numbers are 9 and 3; the result is 3.
  In the third row, the result is 2.
  In this example, the sum of the results would be 4 + 3 + 2 = 9.

  What is the sum of each row's result in your puzzle input?

  ```
  $ cat day2/data.txt | ruby -e 'sum = 0; puts ARGF.read.split("\n").map{|l| digits = l.split.map(&:to_i); div_digits = digits.map{|d| digits.select{|t| t/d != 1 && t % d == 0}.map{|t| t/d}}.flatten.compact}.flatten.reduce(&:+);'
  303
  ```

  ```
  curl 'http://adventofcode.com/2017/day/2/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day2/data.txt
  ```

## Day 1

  The captcha requires you to review a sequence of digits (your puzzle input)
  and find the sum of all digits that match the next digit in the list. The
  list is circular, so the digit after the last digit is the first digit in the
  list.

  For example:

  1122      produces a sum of 3 (1 + 2) because the first digit (1) matches the
            second digit and the third digit (2) matches the fourth digit.
  1111      produces 4 because each digit (all 1) matches the next.
  1234      produces 0 because no digit matches the next.
  91212129  produces 9 because the only digit that matches the next one is the
                       last digit, 9.

  What is the solution to your captcha?

  Your puzzle answer was 1049.

  The first half of this puzzle is complete! It provides one gold star: *

  --- Part Two ---

  You notice a progress bar that jumps to 50% completion. Apparently, the door
  isn't yet satisfied, but it did emit a star as encouragement. The
  instructions change:

  Now, instead of considering the next digit, it wants you to consider the
  digit halfway around the circular list. That is, if your list contains 10
  items, only include a digit in your sum if the digit 10/2 = 5 steps forward
  matches it. Fortunately, your list has an even number of elements.

  For example:

  1212      produces 6: the list contains 4 items, and all four digits match
                        the digit 2 items ahead.
  1221      produces 0, because every comparison is between a 1 and a 2.
  123425    produces 4, because both 2s match each other, but no other digit
                        has a match.
  123123    produces 12.
  12131415  produces 4.

  What is the solution to your new captcha?
  1508

  ```
  curl 'http://adventofcode.com/2017/day/1/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day1/data.txt
  ```

  ```
  cd day1
  ruby day1.rb
  ```

