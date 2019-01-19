require 'pry'

real_input = """........#.##..#|#|.#.....|......#..#.|..##..||.#..
#|##.|||.|..|||......|.##.#|#|....||#.#...#...#..#
..##...#|#..|#.|..#||#...|#....|#...#|#.|.||...|..
.....#|||.|.#...###|....|#..#.#.#.|..#||#|....|#.|
....|.....#.||.#..#...#|....|||..#....##...|..|.#|
||...|###..|..|||..|#.##|.####.#...|.||.|....|.##.
..#.#.###..||......#|#|.|....#|.#|.|...#....#...#|
.|..||||||...#.##..|.#||.#|##|..#.#..##..#...|#...
.|.....||...#.#|.##|..|.##||..#.#..|..#.#.#..|.#|.
||...|#........#.|..##|.|..#...#...#|#|..||.|....#
#||.|.|..|.......##....|..#||#.#|.|||......|..||..
.....#.|||.....|.#.#.......#.|..#.|.....|.|.#...#.
...#.##.#.||#.#|.#.##..#.||#.#.#|#.||.||.|......#.
|.|...#|.|####|.|..#.#|....|......|....|...||#||..
.#...#.#......|...#.....|.....|.#|...##|||...#.|#.
||##.#...#.|...##..##.||#...#|...|##.##...#||..#|.
|.|#.||..|##.|.#.|..#..|.##.#.......#...|....||...
.|.......#..##...|.|..|#.#....|#|..##|#|.##|.|.|#.
.|....|.#|||#.#..#..|||.....||...#|.#..|..#.#...#.
...#..###.#|.##||.#.|.||###..|..|#.|#..||......||.
..##.......##|.....#...|#|..##|.#.|||.|#....|##...
#...#|##|......##|...|#..#.|..##..#..#.|##.##|#..#
|.#|.....|..#...|....|...#....#|..#.....||...|#|.|
##...#.....#.....|#|.......|....####.#..##.|.##...
.....|...|#|#..|#|.|..##.|..|....##..||.#...|..|.|
.|..|....##.||||.##|.#...|..|#|.#.|####.|..|##.#..
#.........|##.#|..##|...|........|..|....|..#...##
.#.|...#...#...|.|...|..|.#.|....#..|.|..|..#|....
.....#.....#|.#....|....##...##....###....#.|...|.
||.....|.|.##|.##||.#|#.##|.#..|#####|...|...||#.#
...#||....#.....##.|##|.##|#.##.#|.|.....#........
..##.....||..#..#.|..##...#.|.|.|.|...|.#.|..|....
|##..|..........##..#|...|......||.#....#....|..#.
...#..|.#.|...|.##|.##..##..|.|....#||#|##..||||..
#...##......|..|#...#.#.|#||..#...|.#...|..###.||.
|#.......|#.|##|....|.....#..||.|#|#...#|....|..#|
.|.....#|##.|.#...#..#||#.....|....#||.#|.##.##.#|
|#..###..#..|#.....##...||.|.|.#.#|.||..||.||#|#..
||||#....|#..|.|...|...||....|...#....#.##...#|...
...||##||#......|#.#..#..|.....|...#..#|...#...|||
.|#.|.|....|...#.....|#....|..#.#...#...||..##|..|
||#.|##.|...|.##......##|#..#..#.#.#.....|#|##.##.
|.#.....||.....#.#...|...|..|#|..|..#...|....|...|
###..#.#......#|..#....#......|##.##....|||.|..#|.
..#.|.#...#..|#####|.....##.|.|#......|..||.#|....
.#||.|.##..#.|..##......|..|.|#..|.....#.....|#|..
|##.#......#.#.#.#|||#|....#...#.|.........|||.#..
|......||.|..#.|#||...||.#.#.##..#..#.#....#.#..#|
#.|..##.....#..|...|#...#...|.......|.|..|#|......
##...#....#..#..#....|...#|#.||.|...|.#..###|##|.|
"""

input = """.#.#...|#.
.....#|##|
.|..|...#.
..|#.....#
#.#|||#|#|
...#.||...
.|....|...
||...#|.#|
|.||||..|.
...#.|..|.
"""

input = real_input

maps = {}
maps[0] = input.split(/\n/).map(&:chars)
OPEN = '.'
TREES = '|'
LUMBERYARD = '#'

def has(num, acre_map, x, y, type)
  x_min = x-1 < 0 ? nil : x-1
  y_min = y-1 < 0 ? nil : y-1
  matches = [
    (acre_map[x_min][y+1] rescue nil),
    (acre_map[x  ][y+1] rescue nil),
    (acre_map[x+1][y+1] rescue nil),
    (acre_map[x_min][y  ] rescue nil),
    (acre_map[x+1][y  ] rescue nil),
    (acre_map[x_min][y_min] rescue nil),
    (acre_map[x  ][y_min] rescue nil),
    (acre_map[x+1][y_min] rescue nil),
  ].compact
  #puts matches.inspect
  #puts matches.inspect - 3.times(type)
  #binding.pry if x == 0 && y == 1
  #binding.pry if x == 1 && y == 6
  matches.count(type) >= num
end

win_map = 10
min = 1000000000
(0..min-1).each do |m|
  puts m if m % 1000 == 0
  new_map = []
  maps[m].each_with_index do |x, x_i|
    x.each_with_index do |y, y_i|
      new_map[x_i] ||= []
      new_map[x_i][y_i] = maps[m][x_i][y_i]
      # open => trees if > 2 trees
      if maps[m][x_i][y_i] == OPEN
        #binding.pry if y_i == 6
        new_map[x_i][y_i] = TREES if has(3, maps[m], x_i, y_i, TREES)
      end
      # trees => lumberyard if > 2 lumberyard
      if maps[m][x_i][y_i] == TREES
        new_map[x_i][y_i] = LUMBERYARD if has(3, maps[m], x_i, y_i, LUMBERYARD)
      end
      # lumberyard => lumberyard if > 0 lunberyard && > 0 trees ELSE lumberyard => open
      if maps[m][x_i][y_i] == LUMBERYARD
        has(1, maps[m], x_i, y_i, LUMBERYARD) && has(1, maps[m], x_i, y_i, TREES) ?
          new_map[x_i][y_i] = LUMBERYARD :
          new_map[x_i][y_i] = OPEN
      end
    end
  end
  maps[m+1] = new_map
  puts "after #{m} minutes:"
  new_map.map do |line|
    puts line.join
  end
  if duplicate = (0..m).find{|i| maps[i].join == new_map.join }
    # duplicate after 444 from 417
    puts "duplicate after #{m} from #{duplicate}"
    #        417 + (100...000 - 417) % (444 - 417)
    win_map = duplicate + 1 + ((min - duplicate + 1) % (m - duplicate - 1))

    break
  end
end

puts "winning map is #{win_map}"
wooded = maps[win_map].join.count(TREES)
lumberyards = maps[win_map].join.count(LUMBERYARD)

puts "wooded #{wooded} * lumberyards #{lumberyards} = #{wooded * lumberyards}"

# win_map = win_map - 1
# puts "winning map is #{win_map}"
# wooded = maps[win_map].join.count(TREES)
# lumberyards = maps[win_map].join.count(LUMBERYARD)
# 
# puts "wooded #{wooded} * lumberyards #{lumberyards} = #{wooded * lumberyards}"
# 
# win_map = win_map + 2
# puts "winning map is #{win_map}"
# wooded = maps[win_map].join.count(TREES)
# lumberyards = maps[win_map].join.count(LUMBERYARD)
# 
# puts "wooded #{wooded} * lumberyards #{lumberyards} = #{wooded * lumberyards}"
