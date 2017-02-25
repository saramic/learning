require 'spec_helper'

def inc_counter(count)
  count + 1
end

def solver_5(input)
  require "digest"
  ary = []
  count = 0
  while(ary.size < 8)
    val = Digest::MD5.hexdigest "#{input}#{count}"
    count = inc_counter(count)
    ary << val if val =~/^00000/
  end
  ary.map{|e| e.chars[5]}.join
end

RSpec.describe 'day 5' do
  before do
    expect(self).to receive(:inc_counter).and_return(1739529, 1910966, 1997199, 2854555, 2963716, 3237361, 4063427, 7777889, 0)
  end
  [
    ['abbhdwsy', '801b56a7']
  ].each do |(input, output)|
    # TODO too slow
    # one way around this would be to:
    #   1) fake out hexdigest to return ["000008bfb72caf77542c32b53a73439b", "0000004ed0ede071d293b5f33de2dc2f", "0000012be6057b2554c26bfddab18b08", "00000bf3f1ca8d1f229aa50b3093b2be", "00000512874cc40b764728993dd71ffb", "0000069710beec5f9a1943a610be52d8", "00000a8da36ee9b7e193f956cf701911", "00000776b6ff41a7e30ed2d4b6663351"]
    #   2) force the counter to go to the correct number to solve quickly [1739530, 1910967, 1997200, 2854556, 2963717, 3237362, 4063428, 7777890]
    it_should_behave_like 'input output solver', :solver_5, input, output
  end
end

