class GameOfLife
  def self.tick(world)
    world.chars.each_with_index.map do |cell, index|
      west = index - 1 >= 0 ? world.chars[index-1] : "."
      east = world.chars[index+1] || "."
      neighbours = "...\n#{west}#{cell}#{east}\n..."
      process(neighbours)
    end.join()
  end

  def self.process(a)
    ""
  end
end

describe GameOfLife do
  it "returns a dead world if a dead world is passed in" do
    expect( GameOfLife.tick("") ).to eq ""
  end

  it "returns a dead world if a a world with lonely cell is passed in" do
    expect( GameOfLife.tick("*") ).to eq ""
  end

  it "returns a dead world if a a world with lonely cells is passed in" do
    expect( GameOfLife.tick("*..*") ).to eq ""
    world_start = <<~EOF.gsub(/\w/, '')
    *
    .
    .
    *
    EOF
    expect( GameOfLife.tick(world_start) ).to eq ""
  end

  xit "3 cells in a row turn to 3 cells vertical" do
    world_start = "***"
    world_end = <<~EOF.gsub(/\w/, '').chomp
    .*.
    .*.
    .*.
    EOF
    expect( GameOfLife.tick("world_start") ).to eq world_end
  end

  it "processes cells to east and west" do
    expect(GameOfLife).to receive(:process).with("...\n..*\n...")
    expect(GameOfLife).to receive(:process).with("...\n.**\n...")
    expect(GameOfLife).to receive(:process).with("...\n**.\n...")
    expect(GameOfLife).to receive(:process).with("...\n*..\n...")
    GameOfLife.tick(".**.")
  end
end
