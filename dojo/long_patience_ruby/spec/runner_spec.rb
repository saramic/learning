# frozen_string_literal: true

require "runner"
require "space"

RSpec.describe Runner do
  it "lists out the deck" do
    output = StringIO.new
    Runner.new(output: output).play
    expect(output.string).to eq <<~EO_OUTPUT
      __  ♥ A ♥ 2 ♥ 3 ♥ 4 ♥ 5 ♥ 6 ♥ 7 ♥ 8 ♥ 9 ♥10 ♥ J ♥ Q ♥ K |
      __  ♦ A ♦ 2 ♦ 3 ♦ 4 ♦ 5 ♦ 6 ♦ 7 ♦ 8 ♦ 9 ♦10 ♦ J ♦ Q ♦ K |
      __  ♣ A ♣ 2 ♣ 3 ♣ 4 ♣ 5 ♣ 6 ♣ 7 ♣ 8 ♣ 9 ♣10 ♣ J ♣ Q ♣ K |
      __  ♠ A ♠ 2 ♠ 3 ♠ 4 ♠ 5 ♠ 6 ♠ 7 ♠ 8 ♠ 9 ♠10 ♠ J ♠ Q ♠ K |
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
