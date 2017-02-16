#!/usr/bin/env ruby

number = ARGV.join.to_i

puts "for loop with mutable values"
sum = 0
count = 0

while count <= number
  sum += count
  count += 1
end
puts sum

puts "number.times pragmatic ruby with mutable value"
sum = 0
(0..number).each {|n| sum += n}
puts sum

puts "reduce pragmatic ruby with mutable value?"
puts (0..number).reduce(:+)

puts "recursive sum - no imutablility"
begin
  def sum_recursive(up_to)
    up_to == 0 ? 0 : up_to + sum_recursive(up_to - 1)
  end
  puts sum_recursive(number)
rescue SystemStackError => e
  puts "Error: #{e}"
end

puts "tail recursive sum - no imutablility"
begin
  def sum_tail_recursive(up_to, acc)
    up_to == 0 ? acc : sum_tail_recursive(up_to - 1, acc + up_to)
  end
  puts sum_tail_recursive(number, 0)
rescue SystemStackError => e
  puts "Error: #{e}"
end

