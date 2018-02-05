require 'spec_helper'

require 'doors'

RSpec.describe 'Which doors to be opened' do
  it 'all doors closed for no person' do
    doors = Doors.new(person: 0, doors: 6)
    expect(doors.open).to eq([false, false, false, false, false, false])
  end
  it 'every door open for 1st person' do
    doors = Doors.new(person: 1, doors: 6)
    expect(doors.open).to eq([true, true, true, true, true, true])
  end
  it 'now 2nd person comes along' do
    doors = Doors.new(person: 2, doors: 6)
    expect(doors.open).to eq([true, false, true, false, true, false])
  end
  it 'now 9th person comes along' do
    doors = Doors.new(person: 9, doors: 10)
    expect(doors.open).to eq([
      true, false, false,
      true, false, false,
      false, false, true,
      true
    ])
  end
  it '100th person in 100 doors' do
    doors = Doors.new(person: 100, doors: 100)
    open_doors = doors
      .open
      .each_with_index
      .select { |open,index| open }
      .map { |open, index| [index + 1, open] }
    expect(Hash[open_doors]).to eq({
      1=>true,
      4=>true,
      9=>true,
      16=>true,
      25=>true,
      36=>true,
      49=>true,
      64=>true,
      81=>true,
      100=>true
    })
  end
end
