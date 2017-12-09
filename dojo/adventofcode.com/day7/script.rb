
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
    @tree[branch][:value]
  else
    branch_sums = @tree[branch][:branches].inject({}) {|hash, b| hash[b] = sum_branch(b); hash }
    if branch_sums.values.uniq.count != 1
      branch_sums.keys.each do |key|
        if branch_sums.values.find_all{|b| b == branch_sums[key]}.length == 1
          puts [key, branch_sums[key]].inspect
          puts "for values #{branch_sums.values}"
          puts @tree[key]
        end
      end
    end
    @tree[branch][:value] + branch_sums.values.sum
  end
end

puts "branches with uneven weights"
sum_branch(overall_root.first)

