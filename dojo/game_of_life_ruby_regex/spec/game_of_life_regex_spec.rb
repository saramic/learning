class GameOfLifeRegex
  LIVE = "*".freeze
  DEAD = ".".freeze

  def self.live?(cell_with_neigbours_string)
    cell_with_neigbours_string.match(/#{"\\" + LIVE}{3}/)
  end
end

describe GameOfLifeRegex do
  shared_examples "a dead cell" do |neighbourhood|
    before do
      neighbourhood = neighbourhood.gsub(/ /, "").chomp.lstrip
    end

    it "is a dead cell" do
      expect(GameOfLifeRegex.live?(neighbourhood)).to be_falsey
    end
  end

  shared_examples "a live cell" do |neighbourhood|
    before do
      neighbourhood = neighbourhood.gsub(/ /, "").chomp.lstrip
    end

    it "is a live cell" do
      expect(GameOfLifeRegex.live?(neighbourhood)).to be_truthy
    end
  end

  # dead stays dead
  it_behaves_like "a dead cell", """
    ...
    ...
    ...
  """

  # dead with 3 neigbours becomes live
  it_behaves_like "a live cell", """
    ***
    ...
    ...
  """
end
