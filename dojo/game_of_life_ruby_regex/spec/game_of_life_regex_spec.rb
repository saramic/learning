require "game_of_life_regex"

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

  context """
    dead stays dead
    --
      ...
      ...
      ...
    """ do
    it_behaves_like "a dead cell", description.sub(/^.*--/m, "")
  end

  context """
    dead with 3 neigbours becomes live
    --
      ***
      ...
      ...
    """ do
    it_behaves_like "a live cell", description.sub(/^.*--/m, "")
  end

  context """
    dead with 3 neigbours in any position becomes live
    --
      *..
      ..*
      .*.
    """ do
    it_behaves_like "a live cell", description.sub(/^.*--/m, "")
  end

  context """
    live with 0 neigbours dies
    --
      ...
      .*.
      ...
    """ do
    it_behaves_like "a dead cell", description.sub(/^.*--/m, "")
  end

  context """
    live with 1 neigbours dies
    --
      ..*
      .*.
      ...
    """ do
    it_behaves_like "a dead cell", description.sub(/^.*--/m, "")
  end

  context """
    live with 2 neighbours lives
    --
      ..*
      .*.
      *..
    """ do
    it_behaves_like "a live cell", description.sub(/^.*--/m, "")
  end

  context """
    live with 3 neigbours dies
    --
      ..*
      .*.
      *.*
    """ do
    it_behaves_like "a dead cell", description.sub(/^.*--/m, "")
  end
end
