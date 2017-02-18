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
  it_should_behave_like 'roman', 10, 'X'
  it_should_behave_like 'roman', 20, 'XX'
  it_should_behave_like 'roman', 30, 'XXX'
  it_should_behave_like 'roman', 40, 'XL'
  it_should_behave_like 'roman', 50, 'L'
  it_should_behave_like 'roman', 90, 'XC'
  it_should_behave_like 'roman', 100, 'C'
  it_should_behave_like 'roman', 400, 'CD'
  it_should_behave_like 'roman', 500, 'D'
  it_should_behave_like 'roman', 900, 'CM'
  it_should_behave_like 'roman', 1000, 'M'
  it_should_behave_like 'roman', 457, 'CDLVII'
  it_should_behave_like 'roman', 1995, 'MCMXCV'
  it_should_behave_like 'roman', 2017, 'MMXVII'
end
