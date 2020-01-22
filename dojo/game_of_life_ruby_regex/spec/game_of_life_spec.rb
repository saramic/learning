class GameOfLife
  def self.tick(world)
    return "" if world == ""
    [world.split("\n")[0]].each_with_index.map do |world_row, row_index|
      world_row.chars.each_with_index.map do |cell, index|
        north_west = "."
        north = "."
        north_east = "."
        west = index - 1 >= 0 ? world.chars[index-1] : "."
        east = world_row.chars[index+1] || "."
        south_west = world.split("\n").join.chars[index - 1 + world_row.chars.length]
        south = world.split("\n").join.chars[index + world_row.chars.length]
        south_east = world.split("\n").join.chars[index + 1 + world_row.chars.length] || "."
        neighbours = [
          [north_west, north, north_east].join,
          [west, cell, east].join,
          [south_west, south, south_east].join,
        ].join("\n")
        process(neighbours)
      end.join
    end.join("\n")
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

  it "processes cells to east, west, south, south-west for 1 line" do
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
    GameOfLife.tick(".**.\n*..*")
  end
end
