require 'roman'

describe Roman do
  shared_examples_for 'roman' do |arabic, roman|
    it arabic do
      expect(Roman.from_arabic(arabic)).to eq roman
    end
  end

  it_should_behave_like 'roman', 0, ''
  it_should_behave_like 'roman', 1, 'I'
  it_should_behave_like 'roman', 2, 'II'
end
