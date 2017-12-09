require 'spec_helper'
require 'parser'

RSpec.describe '#garbage' do
  stuff = <<-EOF
<>, empty garbage.
<random characters>, garbage containing random characters.
<<<<>, because the extra < are ignored.
<{!>}>, because the first > is canceled.
<!!>, because the second ! is canceled, allowing the > to terminate the garbage.
<!!!>>, because the second ! and the first > are canceled.
<{o"i!a,<{i<a>, which ends at the first >.
Here are some examples of whole streams and the number of groups they contain:
EOF

  context '#groups' do
    [
      ['{}', 1],
      ['{{{}}}', 3],
      ['{{},{}}', 3],
      ['{{{},{},{{}}}}', 6],
      ['{<{},{},{{}}>}', 1],
      ['{<a>,<a>,<a>,<a>}', 1],
      ['{{<a>},{<a>},{<a>},{<a>}}', 5],
      ['{{<!>},{<!>},{<!>},{<a>}}', 2],
    ].each do |(input, groups)|
      context "#{groups} in #{input}" do
      subject(:groups) { Parser.new(input).groups.length }
      it { is_expected.to eq groups }
      end
    end
  end

  context '#score' do
    [
      [                           '{}',  1],
      [                       '{{{}}}',  6], # score of 1 + 2 + 3 = 6.
      [                      '{{},{}}',  5], # score of 1 + 2 + 2 = 5.
      [               '{{{},{},{{}}}}', 16], # score of 1 + 2 + 3 + 3 + 3 + 4 = 16.
      [            '{<a>,<a>,<a>,<a>}',  1], # score of 1.
      ['{{<ab>},{<ab>},{<ab>},{<ab>}}',  9], # score of 1 + 2 + 2 + 2 + 2 = 9.
      ['{{<!!>},{<!!>},{<!!>},{<!!>}}',  9], # score of 1 + 2 + 2 + 2 + 2 = 9.
      ['{{<a!>},{<a!>},{<a!>},{<ab>}}',  3], # score of 1 + 2 = 3.
    ].each do |(input, score)|
      context "#{score} for #{input}" do
        subject(:score) { Parser.new(input).score }
        it { is_expected.to eq score }
      end
    end
  end
end

