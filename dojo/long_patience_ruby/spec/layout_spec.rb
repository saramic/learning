require "layout"
require "card"

RSpec.describe Layout do
  let(:two_of_hearts) { Card.new({dark: "♡"}, "2") }
  let(:ace_of_hearts) { Card.new({dark: "♡"}, "A") }

  it "prints out the layout" do
    expect(Layout.new.to_s).to eq <<~EO_DEFAULT_LAYOUT.chomp
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
    EO_DEFAULT_LAYOUT
  end

  it "places the next card in first row with an offset of 1" do
    layout = Layout.new
    layout.place_next(two_of_hearts)
    expect(layout.to_s).to eq <<~EO_LAYOUT_W_CARD.chomp
      __  ♡ 2 __  __  __  __  __  __  __  __  __  __  __  __  |
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
    EO_LAYOUT_W_CARD
  end

  it "places the next card in first row with an offset of 1" do
    layout = Layout.new
    layout.place_next(two_of_hearts)
    layout.place_next(ace_of_hearts)
    expect(layout.to_s).to eq <<~EO_LAYOUT_W_CARD.chomp
      __  ♡ 2 ♡ A __  __  __  __  __  __  __  __  __  __  __  |
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
    EO_LAYOUT_W_CARD
  end

  it "places the next card in the next row if the first row is full" do
    layout = Layout.new
    13.times { layout.place_next(two_of_hearts) }
    layout.place_next(ace_of_hearts)
    expect(layout.to_s).to eq <<~EO_LAYOUT_W_CARD.chomp
      __  ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 |
      __  ♡ A __  __  __  __  __  __  __  __  __  __  __  __  |
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
    EO_LAYOUT_W_CARD
  end

  it "places the next card a space after existing next card in the next row if the first row is full" do
    layout = Layout.new
    13.times { layout.place_next(two_of_hearts) }
    layout.place_next(ace_of_hearts)
    expect(layout.to_s).to eq <<~EO_LAYOUT_W_CARD.chomp
      __  ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 ♡ 2 |
      __  ♡ A __  __  __  __  __  __  __  __  __  __  __  __  |
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
      __  __  __  __  __  __  __  __  __  __  __  __  __  __  |
    EO_LAYOUT_W_CARD
  end
end