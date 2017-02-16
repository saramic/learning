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
end
