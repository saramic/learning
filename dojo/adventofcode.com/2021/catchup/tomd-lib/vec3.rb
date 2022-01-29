class Vec3
  attr_reader :x, :y, :z

  def self.[](x, y, z)
    new(x, y, z)
  end

  def initialize(x, y, z)
    @x, @y, @z = x, y, z
    freeze
  end

  def magnitude
    Math.sqrt(x*x + y*y + z*z)
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
    [x, y, z]
  end

  def *(scalar)
    self.class[scalar*x, scalar*y, scalar*z]
  end

  def +(other)
    raise ArgumentError unless other.is_a?(self.class)

    self.class[x + other.x, y + other.y, z + other.z]
  end

  def -(other)
    raise ArgumentError unless other.is_a?(self.class)

    self + (-other)
  end

  def -@
    self.class[-x, -y, -z]
  end

  def inspect
    "#<#{self.class} #{x}, #{y}, #{z}>"
  end

  def to_s
    inspect
  end
end
