output = {}
('a'..'h').each{|reg| output[reg] = 0 }
commands = ARGF.read.split("\n")
index = 0
mul_count = 0
tick = 0
begin
  loop do
    index_offset = 1
    cmd, reg, o_val = commands[index].split
    val = output.has_key?(o_val) ? output[o_val] : o_val.to_i
    #puts [output['e'], output['g']].inspect
    case cmd
    when 'set'
      output[reg] = val
    when 'sub'
      output[reg] -= val
    when 'mul'
      output[reg] = output[reg] * val
      mul_count += 1
    when 'jnz'
      index_offset = val if output[reg] != 0
    end
    puts [tick, index, commands[index], output].inspect
    index += index_offset
    #puts output.inspect
    #puts mul_count
    #sleep(1)
    tick += 1
  end
rescue Exception => e
  puts e
  puts "index is #{index}"
  puts output.inspect
  puts mul_count
end
