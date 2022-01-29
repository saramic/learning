def process_input(input_string)
  input_string
    .split("\n")
    .map do |line|
      parts = line.split
      [parts[0].to_sym, *parts.slice(1, parts.length)]
    end
end

def process_data(input, program)
  input = input.to_s.chars.map(&:to_i)
  vars = {
    w: 0,
    x: 0,
    y: 0,
    z: 0,
  }
  program
    .each do |instruction|
      #require "pry"; binding.pry
      value = vars.keys.include?(instruction[2].to_sym) ? vars[instruction[2].to_sym] : instruction[2].to_i if instruction.length > 2
      if instruction[0] == :inp
        vars[instruction[1].to_sym] = input.shift
      end
      if instruction[0] == :mul
        vars[instruction[1].to_sym] *= value
      end
      if instruction[0] == :div
        vars[instruction[1].to_sym] = (vars[instruction[1].to_sym].to_f / value).floor
      end
      if instruction[0] == :eql
        vars[instruction[1].to_sym] = vars[instruction[1].to_sym] == vars[instruction[2].to_sym] ? 1 : 0
      end
      if instruction[0] == :add
        vars[instruction[1].to_sym] += value
      end
      if instruction[0] == :mod
        unless instruction[2].to_i.zero?
          vars[instruction[1].to_sym] = vars[instruction[1].to_sym] % instruction[2].to_i
        end
      end
    end
  vars
end
sample1 = <<~EOF_SAMPLE
inp x
mul x -1
EOF_SAMPLE
program = process_input(sample1)
#pp process_data(1, program)

sample2 = <<~EOF_SAMPLE
inp z
inp x
mul z 3
eql z x
EOF_SAMPLE
program = process_input(sample2)
#pp process_data(26, program) # z = 0
#pp process_data(25, program) # z = 1

sample3 = <<~EOF_SAMPLE
inp w
add z w
mod z 2
div w 2
add y w
mod y 2
div w 2
add x w
mod x 2
div w 2
mod w 2
EOF_SAMPLE
program = process_input(sample3)
pp process_data(3,  program)    # 0011
pp process_data(8,  program)    # 1000
pp process_data(9,  program)    # 1001

program = process_input(File.open("input-day24.txt").read)
start = 10**15
largest = nil
while largest.nil?
  start -= 1
  next if start.to_s.chars.find{|char| char == "0"}
  
  result = process_data(start, program)
  break if result[:z] != 0
end
pp start

