sample = <<~EOF_SAMPLE
Player 1 starting position: 4
Player 2 starting position: 8
EOF_SAMPLE

real = <<~EOF_SAMPLE
Player 1 starting position: 7
Player 2 starting position: 5
EOF_SAMPLE

def process_input(input_string)
  input_string
    .split("\n")
    .map do |line|
      [
        line[/Player (\d+)/, 1].to_i,
        {
          position: line[/position: (\d+)/, 1].to_i,
          score: 0,
        }
      ]
    end.to_h
end

players = process_input(sample)
players = process_input(real)

count = 0

while !players.find{|player, stats| stats[:score] >= 1_000}
  players
    .keys
    .each do |player|
      rolls = [count += 1, count += 1, count += 1]
      new_position = ((players[player][:position] + rolls.sum - 1) % 10) + 1
      players[player][:score] += new_position
      players[player][:position] = new_position

      break if players[player][:score] >= 1_000
    end
end

pp "Part 1"
pp count
pp players.map{|player, stats| stats[:score]}.min
pp count * players.map{|player, stats| stats[:score]}.min

def game(p1, p2, s1 = 0, s2 = 0)
  return [0, 1] if s2 >= 12
  w1 = 0
  w2 = 0
  [[3,1], [4,3], [5,6], [6,7], [7,6], [8,3], [9,1]]
    .each do |d, n|
      p = ((p1 + d - 1) % 10) + 1
      v2, v1 = game(p2, p, s2, s1 + p)
      w1 = w1 + (v1 * n)
      w2 = w2 + (v2 * n)
    end
  return w1, w2

end

puts "Part 2"
puts game(*players.map{|player, stats| stats[:position]}).max

