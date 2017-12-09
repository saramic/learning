
lines = ARGF.read.split("\n")

@tree = {}
lines.map{|line|
  m = line.match(/(?<root>\w+) \((?<value>\d+)\)(?:$| -> (?<branches>.*))/)
  branches = []
  branches =  m[:branches].split(", ") if m[:branches]
  @tree[m[:root]] = {
    branches: branches,
    value: m[:value].to_i,
  }
}
overall_root = @tree.keys.uniq.sort - @tree.values.map{|b| b[:branches]}.flatten.compact.uniq.sort
puts overall_root.count
puts overall_root.first

#puts @tree.inspect

def sum_branch(branch)
  #puts branch.inspect
  #puts @tree[branch].inspect
  if @tree[branch][:branches].length == 0
    return @tree[branch][:value]
  else
    return @tree[branch][:value] + @tree[branch][:branches].map{|b| sum_branch(b) }.sum
  end
end

puts @tree[overall_root.first.to_s].inspect
@tree[overall_root.first][:branches].each{|branch|
  puts branch
  puts @tree[branch].inspect
  puts sum_branch(branch) + @tree[overall_root.first.to_s][:value]
}

