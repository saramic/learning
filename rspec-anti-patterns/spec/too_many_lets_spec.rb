class TooManyLets
  def self.array1to10
    (1..10).to_a
  end
end

RSpec.describe TooManyLets do
  let(:one) { 1 }
  let(:two) { 2 }
  let(:three) { 3 }
  let(:four) { 4 }
  let(:five) { 5 }
  let(:six) { 6 }
  let(:seven) { 7 }
  let(:eight) { 8 }
  let(:nine) { 9 }
  let(:ten) { 10 }

  it "creates a range from 1..10" do
    expect(described_class.array1to10).to eq [
      one,
      two,
      three,
      four,
      five,
      six,
      seven,
      eight,
      nine,
      ten,
    ]
  end
end
