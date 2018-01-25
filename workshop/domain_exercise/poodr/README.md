# POODR write the code before reading the chapter

POODR (Practical Object Oriented Development in Ruby) a book by Sandy Metz
shows OO best practices and creates an example of a bike as she goes. Is it
possible to create "domain" level tests to drive out the classes before reading
the chapter? would there be benefit in writing the classes first before
reading?

## Ch 1 Object-Oriented Design

  This seems just general ideas with no code needed to be written?
  or maybe you could to show SOLID principles, DRY principles, making changes
  in OO style?

## Ch 2 Designing Classes with a single responsibility

page 19
input

    ---
    :gears:
    - :gear: 1
      :chainring: 52
      :cog: 11
    - :gear: 2
      :chainring: 30
      :cog: 27

output

    4.7273
    1.1111

Domain Concept:
  Given a box full of gears made of chainrings and cog pairs, return the gear
  ratios
  Note: a gear ratio is the chainring/cog


test

    ```
    ruby -r minitest/pride gear_ratio_test.rb
    ```

