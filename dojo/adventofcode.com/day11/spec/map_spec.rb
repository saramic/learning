require 'spec_helper'

require 'map_coord'
require 'map_cancel'

valid_test_cases = [
  ['ne,ne,ne', 3],
  ['ne,ne,sw,sw', 0],
  ['ne,ne,s,s', 2],
  ['se,sw,se,sw,sw', 3],
]

not_valid_test_cases = [
  [
    File.read(File.join(File.dirname(__FILE__), '..', 'data.txt')).chomp,
    791
  ],
]

RSpec.describe MapCoord do
  [
    *valid_test_cases,
  ].each do |(path, steps)|
    path_string = path[0..19]
    path_string += '...' if path.length > 20
    context "takes #{steps} to return from path #{path_string}" do
      subject(:steps) { MapCoord.new(path).steps }
      it { is_expected.to eq steps }
    end
  end
end

RSpec.describe MapCancel do
  [
    *valid_test_cases,
  ].each do |(path, steps)|
    path_string = path[0..19]
    path_string += '...' if path.length > 20
    context "takes #{steps} to return from path #{path_string}" do
      subject(:steps) { MapCancel.new(path).steps }
      it { is_expected.to eq steps }
    end
  end
end
