inputs = File.read("input-day13.txt").split("\n")
coords = inputs.select { _1.match(/\d,\d/) }
instructions = inputs.select { _1.match(/=/) }
instructions.map! { _1.split(" ")[-1] }

grid_height = inputs.map { _1.split(",")[1].to_i }.max
grid_width = inputs.map { _1.split(",")[0].to_i }.max

grid = []
(0..grid_height).each do
  line = []
  (0..grid_width).each do
    line << "."
  end
  grid << line
end

coords.each do |coord|
  coord = coord.split(",").map { _1.to_i }
  grid[coord[1]][coord[0]] = "*"
end

def display_grid(grid)
  grid.each do |line|
    puts line.join(" ")
  end
end

def apply_fold(grid, instruction)
  dir, value = instruction.split("=")
  if dir == "y"
    moving = []
    (0..grid.count-1).each do |y|
      (0..grid[0].count-1).each do |x|
        next unless y >= value.to_i

        if grid[y][x] == "*"
          moving << [x,y]
        end
      end
    end
    moving.map! { [_1[0], (value.to_i - (value.to_i - _1[1]).abs)] }
    moving.each do |coord|
      grid[coord[1]][coord[0]] = "*"
    end
    grid.slice!(value.to_i..)
  else
    moving = []
    (0..grid.count-1).each do |y|
      (0..grid[0].count-1).each do |x|
        next unless x >= value.to_i

        if grid[y][x] == "*"
          moving << [x,y]
        end
      end
    end
    moving.map! { [(value.to_i - (value.to_i - _1[0]).abs), _1[1]] }
    moving.each do |coord|
      grid[coord[1]][coord[0]] = "*"
    end
    grid.map! { |line| line.slice!(0..value.to_i) }
  end
end

def count_dots(grid)
  dots = 0
  grid.each do |line|
    dots += line.count("*")
  end
  dots
end

instructions.each do |i|
  apply_fold(grid, i)
end
display_grid(grid)
