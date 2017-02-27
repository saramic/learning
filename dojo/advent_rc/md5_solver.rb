#!/usr/bin/env ruby

require "digest"
a = []
count = 0
while(a.size < 8) do
  md5 = Digest::MD5.hexdigest "abbhdwsy#{count}"
  count += 1
  a << md5 if md5 =~ /^00000/
end

puts a.map{|v| v[5]}.join

