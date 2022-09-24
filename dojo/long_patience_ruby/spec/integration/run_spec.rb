# frozen_string_literal: true

require "runner"

RSpec.describe "Run game" do
  let(:run_file_path) { File.join(File.dirname(__FILE__), "../../bin/run.rb") }

  it "lists out the deck" do
    expect(`#{run_file_path}`).to eq <<~EO_OUTPUT
      __  ♥ A ♥ 2 ♥ 3 ♥ 4 ♥ 5 ♥ 6 ♥ 7 ♥ 8 ♥ 9 ♥10 ♥ J ♥ Q ♥ K
      __  ♦ A ♦ 2 ♦ 3 ♦ 4 ♦ 5 ♦ 6 ♦ 7 ♦ 8 ♦ 9 ♦10 ♦ J ♦ Q ♦ K
      __  ♣ A ♣ 2 ♣ 3 ♣ 4 ♣ 5 ♣ 6 ♣ 7 ♣ 8 ♣ 9 ♣10 ♣ J ♣ Q ♣ K
      __  ♠ A ♠ 2 ♠ 3 ♠ 4 ♠ 5 ♠ 6 ♠ 7 ♠ 8 ♠ 9 ♠10 ♠ J ♠ Q ♠ K
    EO_OUTPUT
  end
end
