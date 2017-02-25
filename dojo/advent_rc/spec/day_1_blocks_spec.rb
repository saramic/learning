DIRECTIONS = %w{N E S W}

def walk(x, y, facing, distance)
  case facing
  when 'N'
    return [x, y + distance]
  when 'E'
    return [x + distance, y]
  when 'S'
    return [x, y - distance]
  when 'W'
    return [x - distance, y]
  end
end

def face(facing, direction)
  facing_index = (DIRECTIONS.index(facing) + (direction == 'R' ? 1 : -1)) % 4
  facing = DIRECTIONS[facing_index]
end

def direction_distance(walk)
  m = /[RL]\d+/.match(walk)
  m = /([RL])(\d+)/.match(walk)
  [m[1], m[2].to_i]
end

def solver(input)
  x = y = 0
  facing = DIRECTIONS[0]
  input.split(', ').each do |walk|
    (direction, distance) = direction_distance(walk)
    facing = face(facing, direction)
    (x, y) = walk(x, y, facing, distance)
  end
  x.abs + y.abs
end

RSpec.describe 'day 1' do
  shared_examples_for 'solver' do |input, output|
    it "walk #{input}" do
      expect(solver(input)).to eq output
    end
  end

  it_should_behave_like 'solver', 'R1', 1
  it_should_behave_like 'solver', 'R2', 2
  it_should_behave_like 'solver', 'R1, L1', 2
  it_should_behave_like 'solver', 'L1, R1', 2

  it_should_behave_like 'solver', 'R2, L3', 5
  it_should_behave_like 'solver', 'R2, R2, R2', 2
  it_should_behave_like 'solver', 'R5, L5, R5, R3', 12
  it_should_behave_like 'solver', 'R2, L1, R2, R1, R1, L3, R3, L5, L5, L2, L1, R4, R1, R3, L5, L5, R3, L4, L4, R5, R4, R3, L1, L2, R5, R4, L2, R1, R4, R4, L2, L1, L1, R190, R3, L4, R52, R5, R3, L5, R3, R2, R1, L5, L5, L4, R2, L3, R3, L1, L3, R5, L3, L4, R3, R77, R3, L2, R189, R4, R2, L2, R2, L1, R5, R4, R4, R2, L2, L2, L5, L1, R1, R2, L3, L4, L5, R1, L1, L2, L2, R2, L3, R3, L4, L1, L5, L4, L4, R3, R5, L2, R4, R5, R3, L2, L2, L4, L2, R2, L5, L4, R3, R1, L2, R2, R4, L1, L4, L4, L2, R2, L4, L1, L1, R4, L1, L3, L2, L2, L5, R5, R2, R5, L1, L5, R2, R4, R4, L2, R5, L5, R5, R5, L4, R2, R1, R1, R3, L3, L3, L4, L3, L2, L2, L2, R2, L1, L3, R2, R5, R5, L4, R3, L3, L4, R2, L5, R5',
    234
end
