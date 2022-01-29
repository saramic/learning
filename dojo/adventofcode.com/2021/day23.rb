sample = <<~EOF_SAMPLE
#############
#...........#
###B#C#B#D###
  #A#D#C#A#
  #########
EOF_SAMPLE

#############
#...........#
###B#B#D#D###
  #C#C#A#A#
  #########
2000
10
3000
4000
7
20
600
40
40
4
4
9637
  88
9725

5087
10174
20
2000
7
3000
60
---
70
2000
7
3000
30
#############
#...........#
###A#A#B#B###
  #C#C#D#D#
  #########

def process_input(input_string)
  input_string
    .split("\n")
    .map do |line|
      matches = line.match(/(on|off) x=([^,]+),y=([^,]+),z=([^,]+)/)
      command = matches[1].to_sym
      x_range = eval matches[2]
      y_range = eval matches[3]
      z_range = eval matches[4]
      [command, x_range, y_range, z_range]
    end
end


def process_data(data, in_range: )
end

input = process_input(sample)
process_data(input)
input = process_input(File.open("input-day23.txt").read)
process_data(input)

