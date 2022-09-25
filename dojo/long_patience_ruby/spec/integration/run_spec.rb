# frozen_string_literal: true

require "runner"

RSpec.describe "Run game" do
  let(:run_file_path) { File.join(File.dirname(__FILE__), "../../bin/run.rb") }

  it "lists out the deck" do
    expect(`#{run_file_path} 0`).to eq <<~EO_OUTPUT
      __  ♣ 3 ♣ Q ♥ Q ♣ 9 ♥ 3 ♣ 5 ♠ 2 ♣ 7 ♣ A ♥ 5 ♥ J ♦10 ♣ 6 |
      __  ♣ 4 ♠ 4 ♠ 5 ♥ 8 ♦ 2 ♣ 8 ♠ Q ♦ 6 ♠ J ♣10 ♦ 3 ♥ 6 ♣ 2 |
      __  ♦ 4 ♠ K ♦ 8 ♠ 7 ♥ 9 ♦ A ♦ K ♦ 5 ♣ K ♠ 3 ♥ 2 ♥ K ♠ 8 |
      __  ♦ Q ♥ 7 ♦ J ♣ J ♦ 9 ♦ 7 ♥10 ♠ A ♠10 ♥ 4 ♥ A ♠ 9 ♠ 6 |
    EO_OUTPUT
  end
end
