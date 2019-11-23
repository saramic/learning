# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  result = []
  nums.each_with_index do |num, index|
    nums.each_with_index do |num_2, index_2|
      next if result != [] || index == index_2
      result = [index, index_2] if num + num_2 == target
    end
  end
  result
end

def read_input(input)
  (nums_string, target_string) = input.split("\n").map(&:strip)
  nums = eval(nums_string)
  target = target_string.to_i
  [nums, target]
end

RSpec.describe "two_sum" do
  it "works for basic input" do
    input = <<-INPUT
      [2,7,11,15]
      9
    INPUT
    nums, target = read_input input
    expect(two_sum(nums, target)).to eq [0, 1]
  end

  it "works for basic input" do
    input = <<-INPUT
      [2,7,11,15]
      9
    INPUT
    nums, target = read_input input
    expect(two_sum(nums, target)).to eq [0, 1]
  end

  it "works for 0 input" do
    input = <<-INPUT
      [0,7,0,15]
      0
    INPUT
    nums, target = read_input input
    expect(two_sum(nums, target)).to eq [0, 2]
  end

  it "works for negative input" do
    input = <<-INPUT
      [-3,7,3,15]
      0
    INPUT
    nums, target = read_input input
    expect(two_sum(nums, target)).to eq [0, 2]
  end

  it "works for large input" do
    # require "pry"; binding.pry
    needle = false
    input = File.open(__FILE__)
      .read
      .split("\n")
      .select { |line| needle ||= line == "__END__" }
      .slice(1, 2)
      .join("\n")
    nums, target = read_input input
    expect(two_sum(nums, target)).to eq [0, 2]
  end
end

__END__
[-3,7,3,15]
0
