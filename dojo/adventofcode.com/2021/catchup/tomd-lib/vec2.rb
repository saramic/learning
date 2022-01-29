class Vec2
  attr_reader :x, :y

  def self.[](x, y)
    new(x, y)
  end

  def initialize(x, y)
    @x, @y = x, y
    freeze
  end

  def magnitude
    Math.sqrt(x*x + y*y)
  end

  def ==(other)
    eql?(other)
  end

  def eql?(other)
    raise ArgumentError unless other.is_a?(self.class)

    to_a == other.to_a
  end

  def hash
    ([self.class] + to_a).hash
  end

  def to_a
    [x, y]
  end

  def *(scalar)
    self.class[scalar*x, scalar*y]
  end

  def +(other)
    raise ArgumentError unless other.is_a?(self.class)

    self.class[x + other.x, y + other.y]
  end

  def -(other)
    raise ArgumentError unless other.is_a?(self.class)

    self + (-other)
  end

  def -@
    self.class[-x, -y]
  end

  def to_s
    "#<#{self.class} #{x}, #{y}>"
  end
end
