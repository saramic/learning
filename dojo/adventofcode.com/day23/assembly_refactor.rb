#!/usr/bin/env ruby

# registers with initial values
a, b, c, d, e, f, g, h = 1, 0, 0, 0, 0 ,0 ,0 ,0

b = 84
c = b

if (a != 0)
  b = b * 100 + 10_0000
  c = b + 17_000
end

loop do
  f = 1
  d = 2
  loop do
    e = 2
    loop do
      f = 0 if (d * e != b)
      e += 1
      break if e != b
    end
    d += 1
    break if d != b
  end
  h += 1 if f == 0
  break if b == c
  b += 17
end
puts h
