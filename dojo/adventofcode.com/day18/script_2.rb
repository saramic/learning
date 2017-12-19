output_a = {'p' => 0}
output_b = {'p' => 1}
last_sound = nil
commands = ARGF.read.split("\n")
index_a = 0
index_b = 0
send_a = []
send_b = []
@snd_count = { a: 0, b: 0 }

def till_rcv(commands, output, index, send, receive, prog)
  loop do
    index_offset = 1
    cmd, reg, val = commands[index].split
    cmd, val, reg = commands[index].split if cmd == 'snd'
    output[reg] ||= 0 if reg
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
      @snd_count[prog] += 1
      send << val
      #last_sound = output[reg]
    when 'mod'
      output[reg] = output[reg] % val
    when 'rcv'
      #puts send.inspect
      if receive.length > 0
        output[reg] = receive.shift
      else
        return index
      end
      #break if output[reg] != 0
    when 'jgz'
      index_offset = val if output[reg] != 0
    end
    index += index_offset
  end
end

loop do
  index_a = till_rcv(commands, output_a, index_a, send_a, send_b, :a)
  puts [output_a, index_a, send_a].inspect
  index_b = till_rcv(commands, output_b, index_b, send_b, send_a, :b)
  #puts [output_b, index_b, send_b].inspect
  #puts output_a.inspect
  #puts index_a.inspect
  puts send_b.inspect
  break if commands[index_a].split.first == 'rcv' &&
    commands[index_b].split.first == 'rcv' &&
    send_a.length == 0 &&
    send_b.length == 0
end
puts output_a.inspect
puts output_b.inspect
puts @snd_count.inspect
