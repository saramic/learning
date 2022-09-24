# frozen_string_literal: true

require "runner"

RSpec.describe Runner do
  it "lists out the deck" do
    output = StringIO.new
    Runner.new(output: output).play
    expect(output.string).to eq <<~EO_OUTPUT
      ♥ A ♥ 2 ♥ 3 ♥ 4 ♥ 5 ♥ 6 ♥ 7 ♥ 8 ♥ 9 ♥10 ♥ J ♥ Q ♥ K
      ♦ A ♦ 2 ♦ 3 ♦ 4 ♦ 5 ♦ 6 ♦ 7 ♦ 8 ♦ 9 ♦10 ♦ J ♦ Q ♦ K
      ♣ A ♣ 2 ♣ 3 ♣ 4 ♣ 5 ♣ 6 ♣ 7 ♣ 8 ♣ 9 ♣10 ♣ J ♣ Q ♣ K
      ♠ A ♠ 2 ♠ 3 ♠ 4 ♠ 5 ♠ 6 ♠ 7 ♠ 8 ♠ 9 ♠10 ♠ J ♠ Q ♠ K
    EO_OUTPUT
  end
end
