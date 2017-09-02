require 'spec_helper'
require 'letter'

describe Letter do
  shared_examples_for 'letter diamond' do |char, output|
    let(:letter) { Letter.new(char) }
    subject { letter.diamond }
    it { is_expected.to eq(output) }
  end

  shared_examples_for 'letter diamond line' do |char, output, line|
    let(:letter) { Letter.new(char) }
    subject { letter.diamond.split("\n")[line] }
    it { is_expected.to eq(output) }
  end

  it_behaves_like 'letter diamond', 'A', "A\n"
  it_behaves_like 'letter diamond line', 'A', "A", 0
  it_behaves_like 'letter diamond line', 'A', nil, 1
  it_behaves_like 'letter diamond line', 'B', ".A.", 0
  it_behaves_like 'letter diamond line', 'B', "B.B", 1
  it_behaves_like 'letter diamond line', 'C', "..A..", 0
  it_behaves_like 'letter diamond line', 'C', ".B.B.", 1
  it_behaves_like 'letter diamond line', 'C', "C...C", 2
  it_behaves_like 'letter diamond', 'B', ".A.\nB.B\n.A.\n"
  it_behaves_like 'letter diamond', 'D', <<EOF
...A...
..B.B..
.C...C.
D.....D
.C...C.
..B.B..
...A...
EOF
end