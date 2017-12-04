digits = File.open("data.txt").read.chomp.chars.map(&:to_i); sum = 0; digits.each_with_index{|i, idx| sum += i if digits[(idx + 1) % digits.count] == i }; puts sum

sum = 0; digits.each_with_index{|i, idx| sum += i if digits.rotate(digits.count/2)[idx] == i }; puts sum
