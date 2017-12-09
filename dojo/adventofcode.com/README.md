# Advent of code

logged in via github

can use session cookie for downloads

```
$ export ADVENT_OF_CODE_COOKIE=536...9fa
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

