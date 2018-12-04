require 'spec_helper'

class Day02
  def count_per_line(line)
    0
  end
end

describe Day02 do
  # from https://adventofcode.com/2018/day/2

  # abcdef contains no letters that appear exactly two or three times.
  it "counts nothing for 'abcdef' as there are no letters that occur 2 or 3 times" do
    day02 = Day02.new
    line = 'abcdef'
    expect(day02.count_per_line(line)).to eq 0
  end
 
  # bababc contains two a and three b, so it counts for both.
  it "counts 2 for 'bababc' has two a and three b" do
    pending 'not yet implemented'
    day02 = Day02.new
    line = 'bababc'
    expect(day02.count_per_line(line)).to eq 2
  end

  # abbcde contains two b, but no letter appears exactly three times.
  # abcccd contains three c, but no letter appears exactly two times.
  # aabcdd contains two a and two d, but it only counts once.
  # abcdee contains two e.
  # ababab contains three a and three b, but it only counts once.

  context "multi lines" do
    let(:lines) do
                 #               Action      Accumulator
      ['abcdef', #  0            nothing     2 => 0, 3 => 0
       'bababc', #  2 a and 3 b  +1 on both  2 => 1, 3 => 1
       'abbcde', #  2 b          +1 on 2     2 => 2, 3 => 1 
       'abcccd', #  3 c          +1 on 3     2 => 2, 3 => 2
       'aabcdd', #  2 a and 2 d  +1 on 2     2 => 3, 3 => 2
       'abcdee', #  2 e          +1 on 2     2 => 4, 3 => 2
       'ababab', #  3 a and 3 b  +1 on 3     2 => 4, 3 => 3
      ].join("\n")
    end

    # not implemented
    xit "returns 4 * 3 = 12 as there are 4" do
      day02 = Day02.new(lines)
      expect(day02.answer).to eq 12
    end
  end
end
