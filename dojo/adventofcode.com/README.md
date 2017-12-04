# Advent of code

logged in via github

can use session cookie for downloads
```
$ export ADVENT_OF_CODE_COOKIE=536...9fa
```

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

