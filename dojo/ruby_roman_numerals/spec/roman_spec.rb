require 'roman'

RSpec.describe Roman do
  it 'returns I for 1' do
    expect(Roman.from_arabic(1)).to eql 'I'
  end
  it 'returns II for 2' do
    expect(Roman.from_arabic(2)).to eql 'II'
  end
end
