require "game_of_life"

describe GameOfLife do
  it "returns a dead world if a dead world is passed in" do
    expect(GameOfLife.tick("")).to eq ""
  end

  it "returns a dead world if a a world with lonely cell is passed in" do
    expect(GameOfLife.tick("*")).to eq ""
  end

  it "returns a dead world if a a world with lonely cells is passed in" do
    expect(GameOfLife.tick("*..*")).to eq ""
    world_start = <<~EOF_WORLD.gsub(/\w/, "")
      *
      .
      .
      *
    EOF_WORLD
    expect(GameOfLife.tick(world_start)).to eq ""
  end

  it "3 cells in a row turn to 3 cells vertical (if padded)" do
    world_start = <<~EOF_WORLD.gsub(/\w/, "").chomp
      ...
      ***
      ...
    EOF_WORLD
    world_end = <<~EOF_WORLD.gsub(/\w/, "").chomp
      .*.
      .*.
      .*.
    EOF_WORLD
    expect(GameOfLife.tick(world_start)).to eq world_end
  end

  it "processes cells below, above, on line for multiple lines" do
    _world_start = <<-EOF_WORLD.gsub(/\w/, "").chomp
    .**.
    *..*
    EOF_WORLD
    world_with_neighbours = <<~EOF_WORLD.gsub(/\w/, "").chomp.split("\n")
      ......
      ..**..
      .*..*.
      ......
    EOF_WORLD
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(0, 3).map { |row| row.slice(0, 3).chars })
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(0, 3).map { |row| row.slice(1, 3).chars })
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(0, 3).map { |row| row.slice(2, 3).chars })
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(0, 3).map { |row| row.slice(3, 3).chars })
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(1, 3).map { |row| row.slice(0, 3).chars })
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(1, 3).map { |row| row.slice(1, 3).chars })
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(1, 3).map { |row| row.slice(2, 3).chars })
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(1, 3).map { |row| row.slice(3, 3).chars })
    GameOfLife.tick(".**.\n*..*")
  end

  it "process cells for rule 1 any live cells with 2 or 3 survives" do
    expect(GameOfLife.process("...\n.*.\n...".split("\n").map(&:chars))).to eq "." # dies
    expect(GameOfLife.process("*..\n.*.\n...".split("\n").map(&:chars))).to eq "." # dies
    expect(GameOfLife.process("**.\n.*.\n...".split("\n").map(&:chars))).to eq "*" # lives
    expect(GameOfLife.process("***\n.*.\n...".split("\n").map(&:chars))).to eq "*" # lives
    expect(GameOfLife.process("**.\n.*.\n*..".split("\n").map(&:chars))).to eq "*" # lives
    expect(GameOfLife.process("**.\n.*.\n**.".split("\n").map(&:chars))).to eq "." # dies
  end

  it "process cells for rule 2 any dead cells with 3 becomes live" do
    expect(GameOfLife.process("...\n...\n...".split("\n").map(&:chars))).to eq "." # dead
    expect(GameOfLife.process("*..\n...\n...".split("\n").map(&:chars))).to eq "." # dead
    expect(GameOfLife.process("**.\n...\n...".split("\n").map(&:chars))).to eq "." # dead
    expect(GameOfLife.process("***\n...\n...".split("\n").map(&:chars))).to eq "*" # lives
    expect(GameOfLife.process("**.\n*.*\n...".split("\n").map(&:chars))).to eq "." # dead
  end
end
