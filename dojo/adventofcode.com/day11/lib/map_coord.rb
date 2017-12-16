class MapCoord
  def initialize(input)
    @input = input.split(',')
  end

  def steps(route: @input)
    ewcount = 0
    dist = {x: 0, y: 0}
    route.each do |s|
      # east west counter
      ewcount += s.chars.last == "e" ? 1 : s.chars.last == "w" ? -1 : 0
      # east west inc only on odd number of east west count
      ewinc = (ewcount % 2)
      # using odd-q vertical layout
      # https://www.redblobgames.com/grids/hexagons/#coordinates-offset
      (x,y) = s=="n" ? [0,1] :  # strait north
        s=="s" ? [0,-1] :       # strait south
        s=="ne" ? [1,ewinc] :   # a bit north and east
        s=="nw" ? [-1,ewinc] :
        s=="se" ? [1,-ewinc] :
        s=="sw" ? [-1,-ewinc] :
        nil
      dist[:x] += x
      dist[:y] += y
    end

    calc_distance(dist[:x], dist[:y])
  end

  def calc_distance(x, y)
    x = x.abs
    y = y.abs
    x_half_ceil = ((x/2)+1).ceil
    x_half_ceil >= y ? x : x + (y - x_half_ceil)
  end

  def max_steps
    @input.each_with_index.map do |_dir, index|
      steps = steps(route: @input.slice(0, index))
      puts [index, steps].inspect
      steps
    end.max
  end
end
