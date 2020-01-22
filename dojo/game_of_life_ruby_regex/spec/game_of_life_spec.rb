require 'game_of_life'

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

  it "processes cells below, above, on line for multiple lines" do
    world_start = <<-EOF.gsub(/\w/, '').chomp
    .**.
    *..*
    EOF
    world_with_neighbours = <<~EOF.gsub(/\w/, '').chomp.split("\n")
    ......
    ..**..
    .*..*.
    ......
    EOF
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(0,3).map{|row| row.slice(0,3) }.join("\n"))
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(0,3).map{|row| row.slice(1,3) }.join("\n"))
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(0,3).map{|row| row.slice(2,3) }.join("\n"))
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(0,3).map{|row| row.slice(3,3) }.join("\n"))
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(1,3).map{|row| row.slice(0,3) }.join("\n"))
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(1,3).map{|row| row.slice(1,3) }.join("\n"))
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(1,3).map{|row| row.slice(2,3) }.join("\n"))
    expect(GameOfLife).to receive(:process)
      .with(world_with_neighbours.slice(1,3).map{|row| row.slice(3,3) }.join("\n"))
    GameOfLife.tick(".**.\n*..*")
  end

  it "process cells for rule 1 any live cells with 2 or 3 survives" do
    expect(GameOfLife.process("...\n.*.\n...")).to eq "." # dies
    expect(GameOfLife.process("*..\n.*.\n...")).to eq "." # dies
    expect(GameOfLife.process("**.\n.*.\n...")).to eq "*" # lives
    expect(GameOfLife.process("***\n.*.\n...")).to eq "*" # lives
    expect(GameOfLife.process("**.\n.*.\n*..")).to eq "*" # lives
    expect(GameOfLife.process("**.\n.*.\n**.")).to eq "." # dies
  end

  it "process cells for rule 2 any dead cells with 3 becomes live" do
    expect(GameOfLife.process("...\n...\n...")).to eq "." # dead
    expect(GameOfLife.process("*..\n...\n...")).to eq "." # dead
    expect(GameOfLife.process("**.\n...\n...")).to eq "." # dead
    expect(GameOfLife.process("***\n...\n...")).to eq "*" # lives
    expect(GameOfLife.process("**.\n*.*\n...")).to eq "." # dead
  end
end
