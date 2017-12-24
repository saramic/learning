#!/usr/bin/env ruby
# assuming you have __goto__ and __label__ enabled in your ruby
# http://patshaughnessy.net/2012/2/29/the-joke-is-on-us-how-ruby-1-9-supports-the-goto-statement

# registers with initial values
a, b, c, d, e, f, g, h = 1, 0, 0, 0, 0 ,0 ,0 ,0

#  0 set b 84
b = 84
#  1 set c b
c = b

if (a != 0)
  b = b * 100 + 10_0000
  c = b + 17_000
end

loop
  f = 1
  d = 2
  do
    e = 2
    # 11 set g d
    __label__(:line_11)
    g = d * e - b
    # 14 jnz g 2
    __goto__(:line_16) if g != 0
    # 15 set f 0
    f = 0
    # 16 sub e -1
    __label__(:line_16)
    e += 1
    # 17 set g e
    g = e - b
    # 19 jnz g -8
    __goto__(:line_11) if g != 0
    # 20 sub d -1
    d += 1
    # 21 set g d
    g = d - b
    # 23 jnz g -13
  end while (d != b)

  h += 1 if f == 0
  break if b == c
  b += 17
end
puts h
