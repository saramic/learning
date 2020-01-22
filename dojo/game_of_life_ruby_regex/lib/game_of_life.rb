class GameOfLife
  def self.tick(world)
    return "" if world == ""
    new_world = world.split("\n").each_with_index.map do |world_row, row_index|
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
    new_world.split("\n").join.chars.count{|cell| cell == "*"} == 0 ? "" : new_world
  end

  def self.process(neighbours)
    n_array = neighbours.split("\n").map{|row| row.split("")}
    live_count = n_array.flatten.count{|cell| cell == "*" }
    return "*" if (n_array[1][1] == "." && (live_count == 3))
    (n_array[1][1] == "*" && (live_count == 3 || live_count == 4)) ? "*" : "."
  end
end
