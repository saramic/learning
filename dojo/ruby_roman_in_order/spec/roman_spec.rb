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
  it_should_behave_like 'roman', 3, 'III'
  it_should_behave_like 'roman', 4, 'IV'
  it_should_behave_like 'roman', 5, 'V'
  it_should_behave_like 'roman', 6, 'VI'
  it_should_behave_like 'roman', 7, 'VII'
  it_should_behave_like 'roman', 8, 'VIII'
  it_should_behave_like 'roman', 9, 'IX'
end
