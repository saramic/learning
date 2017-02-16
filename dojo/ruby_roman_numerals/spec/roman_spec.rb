require 'roman'

RSpec.describe Roman do
  shared_examples_for 'roman' do |arabic, roman|
    subject { Roman }
    it { expect(subject.from_arabic(arabic)).to eql roman}
  end

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
