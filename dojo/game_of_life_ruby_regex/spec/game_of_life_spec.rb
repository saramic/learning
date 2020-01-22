class GameOfLife
  def self.tick(world)
    return "" if world == ""
    world.split("\n")[0].chars.each_with_index.map do |cell, index|
      west = index - 1 >= 0 ? world.chars[index-1] : "."
      east = world.split("\n")[0].chars[index+1] || "."
      south = world.split("\n").join.chars[index + world.split("\n")[0].chars.length]
      neighbours = "...\n#{west}#{cell}#{east}\n.#{south}."
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

  it "processes cells to east, west and south for 1 line" do
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
    expect(GameOfLife).to receive(:process).with("...\n.**\n...")
    expect(GameOfLife).to receive(:process).with("...\n**.\n...")
    expect(GameOfLife).to receive(:process).with("...\n*..\n.*.")
    GameOfLife.tick(".**.\n*..*")
  end
end
