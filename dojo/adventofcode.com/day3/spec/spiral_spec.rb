require 'spec_helper'
require 'spiral'

RSpec.describe Spiral do
  it '#pretty_prints' do
    output = <<-EOF
 0  0  0  0  0
 0  5  4  3  0
 0  6  1  2  0
 0  7  8  9 10
 0  0  0  0  0
 EOF

    writer = StringIO.new
    expect(writer).to receive(:puts).with(output)
    Spiral.new(10).pretty_print(writer: writer)
  end

  {
    1 => [[1]],
    2 => [[0,0,0],[0,1,2],[0,0,0]],
    3 => [[0,0,3],[0,1,2],[0,0,0]],
    4 => [[0,4,3],[0,1,2],[0,0,0]],
    5 => [[5,4,3],[0,1,2],[0,0,0]],
    6 => [[5,4,3],[6,1,2],[0,0,0]],
    7 => [[5,4,3],[6,1,2],[7,0,0]],
    8 => [[5,4,3],[6,1,2],[7,8,0]],
    9 => [[5,4,3],[6,1,2],[7,8,9]],
    10 => [
      [0,0,0,0, 0],
      [0,5,4,3, 0],
      [0,6,1,2, 0],
      [0,7,8,9,10],
      [0,0,0,0, 0]
    ],
    25 => [
      [17,16,15,14,13],
      [18, 5, 4, 3,12],
      [19, 6, 1, 2,11],
      [20, 7, 8, 9,10],
      [21,22,23,24,25]
    ],
  }.each do |limit, square|

    context "limit #{limit} to #{square}" do
      subject(:spiral) { Spiral.new(limit) }
      it { expect(spiral.show).to eq(square) }
    end
  end

  context '#adjacent_sums' do
    {
      1 => [[1]],
      2 => [[0,0,0],[0,1,1],[0,0,0]],
      3 => [[0,0,2],[0,1,1],[0,0,0]],
      9 => [[5,4,2],[10,1,1],[11,23,25]],
      25 => [
        [147, 142, 133, 122,  59],
        [304,   5,   4,   2,  57],
        [330,  10,   1,   1,  54],
        [351,  11,  23,  25,  26],
        [362, 747, 806, 880, 931]
      ],
    }.each do |limit, square|

      context "limit #{limit} to #{square}" do
        subject(:spiral) { Spiral.new(limit) }
        it { expect(spiral.adjacent_sums).to eq(square) }
      end
    end
  end
end
