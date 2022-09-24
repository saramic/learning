require "space"
require "card"

RSpec.describe Space do
  let(:space) { Space.new }
  let(:two_of_hearts) do
    Card.new(
      {dark: "️♥", light: "♡", card: "🂲"},
      "2",
    )
  end

  it "represents a space" do
    expect(space.to_s).to eq "__ "
    expect(space).to be_empty
  end

  it "can optionally contain a card" do
    space.place(two_of_hearts)
    expect(space.to_s).to match "♥ 2" # match due to icon
    expect(space).not_to be_empty
  end

  it "a card can be picked up from a space" do
    space.place(two_of_hearts)
    expect(space.to_s).to match "♥ 2" # match due to icon
    card = space.pickup
    expect(space.to_s).to eq "__ "
    expect(card).to eq two_of_hearts
  end
end