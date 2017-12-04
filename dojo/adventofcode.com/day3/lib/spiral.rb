class Spiral
  attr_reader :adjacent_sums

  def initialize(limit)
    @limit = limit
    @ary = set_blank_array
    @adjacent_sums = set_blank_array
    (@x_inc, @y_inc) = [1, 0] # bottom right
    ary_fill
  end

  def show
    @ary
  end

  def pretty_print(ary: @ary, writer: $stdout)
    output = []
    ary.each{|l| output << l.map{|d| sprintf("%#{@limit.to_s.chars.length}d", d)}.join(" ") }
    writer.puts [output.join("\n"), "\n"].join
  end

  def fit_limit(limit)
    fit_limit = Math.sqrt(limit).ceil**2
    fit_limit += 1 if fit_limit.even?
    fit_limit
  end

  def ary_fill
    x = y = (height(@limit)/2).floor
    (1..@limit).each do |counter|
      #puts [x, y, @x_inc, @y_inc, @ary].inspect
      set_increment(counter,x,y)
      @ary[y][x] = counter if @ary[y][x] == 0 # don't let overwrite
      @adjacent_sums[y][x] = sum_adjacents(y, x)
      @adjacent_sums[y][x] = 1 if @adjacent_sums[y][x] == 0 # first number on board
      x += @x_inc
      y += @y_inc
      #puts [x, y, @x_inc, @y_inc, @ary].inspect
    end
  end

  def sum_adjacents(y, x)
    vals = [
      [-1, -1], [ 0, -1], [ 1, -1],
      [-1,  0], [ 0,  0], [ 1,  0], # center being calculated is zero, left in for completness
      [-1,  1], [ 0,  1], [ 1,  1],
    ].map do |x_offset, y_offset|
      x_val = x + x_offset
      y_val = y + y_offset
      next if x_val < 0 ||
        y_val < 0 ||
        x_val > height(@limit).ceil - 1 ||
        y_val > height(@limit).ceil - 1
      @adjacent_sums[y_val][x_val]
    end
    vals.compact.sum
  end

  def set_increment(count, x, y)
    #puts "X:#{x} Y:#{y} rel min:#{rel_min_limit(count)} rel max:#{rel_max_limit(count)} for count:#{count}"
    if @x_inc == 1 && @y_inc == 0 && x == rel_max_limit(count)
      # right up
      @x_inc = 0
      @y_inc = -1
    elsif y == rel_min_limit(count) && @y_inc == -1
      # top left
      @x_inc = -1
      @y_inc = 0
   elsif y == rel_min_limit(count) && x == rel_min_limit(count) && @x_inc == -1# || !@x_inc # not null
     # left down
     @x_inc = 0
     @y_inc = 1
   elsif @x_inc == 0 && @y_inc == 1 && y == rel_max_limit(count)
      # bottom right
      @x_inc = 1
      @y_inc = 0
    end
    if 1 + rel_max_limit(count) == rel_max_limit(count + 1) # transition
      # bottom right
      @x_inc = 1
      @y_inc = 0
    end
  end

  def rel_min_limit(count)
    # center (3,3) - rel_height/2.round (1)
    (height(@limit)/2).ceil - (height(count)/2).floor - 1
  end

  def rel_max_limit(count)
    # center (1,1) + rel_height/2 (1.5
    (height(@limit)/2).ceil + (height(count)/2).floor - 1
  end

  def height(limit)
    Math.sqrt(fit_limit(limit))
  end

  def set_blank_array
    ary = []
    Array.new(height(@limit).ceil, 0)
    (0..height(@limit).ceil-1).to_a.each do |row|
      ary[row] = Array.new(height(@limit).ceil, 0)
    end
    ary
  end
end
