class GameOfLife
  def self.tick(world)
    return "" if world == ""
    world.split("\n").each_with_index.map do |world_row, row_index|
      world_row.chars.each_with_index.map do |cell, index|
        prev_row = row_index - 1 >= 0 ?
          world.split("\n")[row_index - 1] :
          Array.new(world_row.chars.length, ".").join
        north_west = index - 1 >= 0 ?prev_row[index - 1] : "."
        north = prev_row[index]
        north_east = prev_row[index + 1] || "."
        west = index - 1 >= 0 ? world_row[index-1] : "."
        east = world_row.chars[index+1] || "."
        world_depth = world.split("\n").length
        next_row = world.split("\n")[row_index + 1] ||
          Array.new(world_row.chars.length, ".").join
        south_west = index - 1 >= 0 ? next_row[index - 1] : "."
        south = next_row.chars[index]
        south_east = next_row[index + 1] || "."
        neighbours = [
          [north_west, north, north_east].join,
          [west, cell, east].join,
          [south_west, south, south_east].join,
        ].join("\n")
        process(neighbours)
      end.join
    end.reject{|row| row == ""}.join("\n")
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
end
