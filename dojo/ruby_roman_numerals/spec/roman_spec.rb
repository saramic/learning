require 'roman'

RSpec.describe Roman do
  it 'returns I for 1' do
    expect(Roman.from_arabic(1)).to eql 'I'
  end
end
