require 'roman'

RSpec.describe Roman do
  shared_examples_for 'roman' do |arabic, roman|
    subject { Roman }
    it "#{arabic} == #{roman}" do
      expect(subject.from_arabic(arabic)).to eql roman
    end
  end

  context 'zero is empty' do
    it_should_behave_like 'roman', 0, ''
  end

  context 'base numerals' do
    it_should_behave_like 'roman', 1, 'I'
    it_should_behave_like 'roman', 2, 'II'
    it_should_behave_like 'roman', 3, 'III'
    it_should_behave_like 'roman', 5, 'V'
    it_should_behave_like 'roman', 10, 'X'
    it_should_behave_like 'roman', 50, 'L'
    it_should_behave_like 'roman', 100, 'C'
    it_should_behave_like 'roman', 500, 'D'
    it_should_behave_like 'roman', 1000, 'M'
  end

  context '3 of a kind for 10s' do
    it_should_behave_like 'roman', 1, 'I'
    it_should_behave_like 'roman', 2, 'II'
    it_should_behave_like 'roman', 3, 'III'
    it_should_behave_like 'roman', 20, 'XX'
    it_should_behave_like 'roman', 30, 'XXX'
    it_should_behave_like 'roman', 80, 'LXXX'
    it_should_behave_like 'roman', 200, 'CC'
  end

  context '1 less then numeral' do
    it_should_behave_like 'roman', 4, 'IV'
    it_should_behave_like 'roman', 40, 'XL'
    it_should_behave_like 'roman', 400, 'CD'
  end

  context 'complex types' do
    it_should_behave_like 'roman', 6, 'VI'
    it_should_behave_like 'roman', 7, 'VII'
    it_should_behave_like 'roman', 8, 'VIII'
    it_should_behave_like 'roman', 457, 'CDLVII'
    it_should_behave_like 'roman', 1995, 'MCMXCV'
    it_should_behave_like 'roman', 2017, 'MMXVII'
  end
end
