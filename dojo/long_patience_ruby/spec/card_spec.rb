# frozen_string_literal: true

require "card"

RSpec.describe Card do
  let(:two_of_hearts) do
    Card.new(
      {dark: "️♥", light: "♡", card: "🂲"},
      "2",
    )
  end

  it "can represent a card" do
    expect(two_of_hearts.to_s).to match("♥ 2") # match for some reason?
  end

  it "can represent a card in light mode" do
    expect(two_of_hearts.to_s(:light)).to eq("♡ 2")
  end

  it "can represent a card as the actual card" do
    expect(two_of_hearts.to_s(:card)).to eq("🂲")
  end
end
