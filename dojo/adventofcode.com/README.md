# Advent of code

logged in via github

can use session cookie for downloads
```
$ export ADVENT_OF_CODE_COOKIE=536...9fa
```

## Day 2

  ...

  ```
  curl 'http://adventofcode.com/2017/day/2/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day2/data.txt
  ```

## Day 1

  The captcha requires you to review a sequence of digits (your puzzle input)
  and find the sum of all digits that match the next digit in the list. The
  list is circular, so the digit after the last digit is the first digit in the
  list.

  For example:

  1122  produces a sum of 3 (1 + 2) because the first digit (1) matches the
        second digit and the third digit (2) matches the fourth digit.
  1111  produces 4 because each digit (all 1) matches the next.
  1234  produces 0 because no digit matches the next.
  91212129 produces 9 because the only digit that matches the next one is the last digit, 9.

  What is the solution to your captcha?

  ```
  curl 'http://adventofcode.com/2017/day/1/input' -H "Cookie: session=${ADVENT_OF_CODE_COOKIE}" > day1/data.txt
  ```

  ```
  cd day1
  ruby day1.rb
  ```

