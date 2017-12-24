#!/usr/bin/env ruby
# assuming you have __goto__ and __label__ enabled in your ruby
# http://patshaughnessy.net/2012/2/29/the-joke-is-on-us-how-ruby-1-9-supports-the-goto-statement

#  0 set b 84
b = 84
#  1 set c b
c = b
#  2 jnz a 2
__goto__(:line_4) if a != 0
#  3 jnz 1 5
__goto__(:line_8) if 1 != 0
#  4 mul b 100
__label__(:line_4)
b = b * 100
#  5 sub b -100000
b -= -100000
#  6 set c b
c = b
#  7 sub c -17000
c -= -17000
#  8 set f 1
__label__(:line_8)
f = 1
#  9 set d 2
d = 2
# 10 set e 2
__label__(:line_10)
e = 2
# 11 set g d
__label__(:line_11)
g = d
# 12 mul g e
g = g * e
# 13 sub g b
g -= b
# 14 jnz g 2
__goto__(:line_16) if g != 0
# 15 set f 0
f = 0
# 16 sub e -1
__label__(:line_16)
e -= -1
# 17 set g e
g = e
# 18 sub g b
g -= b
# 19 jnz g -8
__goto__(:line_11) if g != 0
# 20 sub d -1
d -= -1
# 21 set g d
g = d
# 22 sub g b
g -= b
# 23 jnz g -13
__goto__(:line_10) if g != 0
# 24 jnz f 2
__goto__(:line_26) if f != 0
# 25 sub h -1
h -= -1
# 26 set g b
__label__(:line_26)
g = b
# 27 sub g c
g -= c
# 28 jnz g 2
__goto__(:line_30) if g != 0
# 29 jnz 1 3
__goto__(:line_32) if 1 != 0
# 30 sub b -17
__label__(:line_30)
b -= -17
# 31 jnz 1 -23
__goto__(:line_8) if 1 != 0
__label__(:line_32)
