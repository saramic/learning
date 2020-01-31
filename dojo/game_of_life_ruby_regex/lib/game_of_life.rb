require "game_of_life_regex"

class GameOfLife
  LIVE = "*".freeze
  DEAD = ".".freeze

  class << self
    def tick(world)
      return "" if world == ""

      new_world = world.split("\n").each_with_index.map do |world_row, row_index|
        world_row.chars.each_with_index.map do |cell, index|
          prev_row = row_index - 1 >= 0 ?
            world.split("\n")[row_index - 1] :
            Array.new(world_row.chars.length, ".").join
          north_west = index - 1 >= 0 ? prev_row[index - 1] : "."
          north = prev_row[index]
          north_east = prev_row[index + 1] || "."
          west = index - 1 >= 0 ? world_row[index - 1] : "."
          east = world_row.chars[index + 1] || "."
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
          process(as_3_by_3(neighbours))
          # process_regex(neighbours) # comment out to use the count
        end.join
      end.reject { |row| row == "" }.join("\n")
      new_world.split("\n").join.chars.count { |cell| cell == "*" } == 0 ? "" : new_world
    end

    def process_regex(neighbours)
      GameOfLifeRegex.live?(neighbours) ? LIVE : DEAD
    end

    def process(neighbours)
      return LIVE if neighbour_live_count(neighbours) == 3

      cell_is_live?(neighbours) && neighbour_live_count(neighbours) == 2 ? LIVE : DEAD
    end

    private

    def as_3_by_3(neighbours)
      neighbours.split("\n").map { |row| row.split("") }
    end

    def cell_is_dead?(neighbours)
      neighbours[1][1] == DEAD
    end

    def cell_is_live?(neighbours)
      !cell_is_dead?(neighbours)
    end

    def neighbour_live_count(neighbours)
      n_array = neighbours.flatten
      n_array.delete_at(4)
      n_array.count { |cell| cell == LIVE }
    end
  end
end
