# frozen_string_literal: true

require "runner"
require "space"

RSpec.describe Runner do
  it "lists out the deck" do
    output = StringIO.new
    Runner.new(output: output, seed: 0).play
    expect(output.string).to eq <<~EO_OUTPUT
      __  ♣ 3 ♣ Q ♥ Q ♣ 9 ♥ 3 ♣ 5 ♠ 2 ♣ 7 ♣ A ♥ 5 ♥ J ♦10 ♣ 6 |
      __  ♣ 4 ♠ 4 ♠ 5 ♥ 8 ♦ 2 ♣ 8 ♠ Q ♦ 6 ♠ J ♣10 ♦ 3 ♥ 6 ♣ 2 |
      __  ♦ 4 ♠ K ♦ 8 ♠ 7 ♥ 9 ♦ A ♦ K ♦ 5 ♣ K ♠ 3 ♥ 2 ♥ K ♠ 8 |
      __  ♦ Q ♥ 7 ♦ J ♣ J ♦ 9 ♦ 7 ♥10 ♠ A ♠10 ♥ 4 ♥ A ♠ 9 ♠ 6 |
    EO_OUTPUT
  end

  it "has a default layout with an empty spaces at the front of each row" do
    runner = Runner.new(output: Kernel)
    expect(runner.layout.dig(:row1, :spaces, 0)).to be_empty
    expect(runner.layout.dig(:row1, :spaces, 1)).not_to be_empty
    expect(runner.layout.dig(:row2, :spaces, 0)).to be_empty
    expect(runner.layout.dig(:row3, :spaces, 0)).to be_empty
    expect(runner.layout.dig(:row4, :spaces, 0)).to be_empty
  end
end
