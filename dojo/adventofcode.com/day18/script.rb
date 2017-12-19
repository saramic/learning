output = {}
last_sound = nil
commands = ARGF.read.split("\n")
index = 0
loop do
  index_offset = 1
  cmd, reg, val = commands[index].split
  output[reg] ||= 0
  val = output.has_key?(val) ? output[val] : val.to_i
  puts [cmd, reg, val].inspect
  case cmd
  when 'set'
    output[reg] = val
  when 'add'
    output[reg] += val
  when 'mul'
    output[reg] = output[reg] * val
  when 'snd'
    last_sound = output[reg]
  when 'mod'
    output[reg] = output[reg] % val
  when 'rcv'
    break if output[reg] != 0
  when 'jgz'
    index_offset = val if output[reg] != 0
  end
  puts output.inspect
  puts last_sound
  index += index_offset
end
puts output.inspect
puts last_sound
