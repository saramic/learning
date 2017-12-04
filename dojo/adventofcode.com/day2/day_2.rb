sum = 0; ARGF.read.split("\n").map{|l| digits = l.split.map(&:to_i); sum += digits.max - digits.min}; puts sum
