## Learning

    “ Live as if you were to die tomorrow. Learn as if you were to live
      forever.”
                                                              ― Mahatma Gandhi


## Learning

    “ You should plan on working 60 hours per week. The first 40 are for your
      employer. The remaining 20 are for you. During this remaining 20 are for
      you. During this remaining 20 hours you should be reading, practicing,
      learning, and otherwise enhancing your career.”

                                                            - Robert C. Martin


## Learning

    “ Most of what Boom is doing was not common practice 2 years ago. It would
      take you more then 38 hours/week to become productive”

                                                            - Michael Milewski


## Learning

  *Aims:*
    * help, encourage, and nurture an environment of continual learning
    * share learnings


# FP Patterns

*Using functional programming patterns to learn and evaluate functional
languages*

First in Ruby

Followed by Functional implementations in:
  - Scala
  - Clojure
  - Elixir
  - Javascript


## Tail Recursion

Loop to sum all the numbers up to a limit

```ruby
    sum = 0
    count = 0

    while count <= number
      sum += count
      count += 1
    end
    puts sum
```


## Tail Recursion

although might be more ruby idiomatic if

  ```ruby
      sum = 0
      (0..number).each {|n| sum += n}
      puts sum

      # or even

      puts (0..number).reduce(:+)
  ```


## Tail Recursion

but we could do it with a recursive solution

```ruby
    def sum_recursive(up_to)
      up_to == 0 ? 0 : up_to + sum_recursive(up_to - 1)
    end
    puts sum_recursive(number)
```


## Tail Recursion

for tail call optimisation (TCO) to work we need to pass an accumulator

```ruby
    def sum_tail_recursive(up_to, acc)
      up_to == 0 ? acc : sum_tail_recursive(up_to - 1, acc + up_to)
    end
    puts sum_tail_recursive(number, 0)

    # and use some compiler flags

    RubyVM::InstructionSequence.compile_option = {
      tailcall_optimization: true,
      trace_instruction: false
    }
```


## Tail Recursion

*Demo*

  ```sh
      ruby -I ./tail_recursion/ -e \
        'require "demo"; puts sum_tail_recursive(10_000, 0)'

      ruby -I ./tail_recursion/ -e \
        'RubyVM::InstructionSequence.compile_option = \
          {tailcall_optimization: true, trace_instruction: false}; \
        require "demo"; puts sum_tail_recursive(10_000, 0)'
  ```


## Tail Recursion

Clojure

  ```clojure
      (defn sum [n]
        (if (= n 0)
          0
          (+ n (sum (dec n)))))

      ;; run it using lein

      cd tail_recursion
      lein run 100
      lein run 10000
      cd -
  ```


## Tail Recursion

Clojure with TCO

  ```clojure
      (defn sum_tail_recursive [n]
        (loop [n n acc 0]
          (if (= n 0)
            acc
            (recur
              (dec n)
              (+ acc n)))))

      ;; run it using lein

      cd tail_recursion && lein run 10000 && cd -
  ```


## Tail Recursion

Of course with the help of Gauss we could have just

  ```ruby
      puts number*(number + 1)/2

      # in the shell

      ruby -e 'number = ARGV.join.to_i; puts number*(number + 1)/2'
  ```


## Tail Recursion

roman numerals with recursion

  ```sh
      ruby -e 'require "yaml"; DATA = YAML.load_file("./tail_recursion/numerals.yml"); \
        def roman(i) \
          DATA.each { |r, a| return r + roman(i-a) if i >= a } ; "" \
        end; \
        puts roman(10_000_000)'
  ```


## Tail Recursion

WIP on roman numerals with tail recursion

  ```ruby
      DATA = YAML.load_file(File.join(File.dirname(__FILE__), "numerals.yml"))

      def roman_tail(i, acc="")
        DATA.each { |r, a| return roman_tail(i-a, acc + r) if i >= a }
        acc
      end
  ```
  ```sh
      # and to run this

      ruby -I ./tail_recursion -e \
        'RubyVM::InstructionSequence.compile_option = \
          {tailcall_optimization: true, trace_instruction: false}; \
        require "roman"; \
        puts roman_tail(10_000_000)'
  ```
