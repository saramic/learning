#!/usr/bin/env ruby -Ilib

require 'byebug'

class Pair
  attr_accessor :left, :right, :depth, :parent, :parent_side

  def self.coerce(obj, depth: 0, parent: nil, parent_side: nil)
    case obj
    when Integer
      obj
    when Array
      raise "bad pair" if obj.size != 2
      new.tap do |pair|
        pair.parent = parent
        pair.parent_side = parent_side
        pair.depth = depth
        pair.left = coerce(obj.first, depth: depth+1, parent: pair, parent_side: :left)
        pair.right = coerce(obj.last, depth: depth+1, parent: pair, parent_side: :right)
      end
    else
      raise NotImplementedError
    end
  end

  def self.new_root(left, right)
    raise ArgumentError unless left.parent.nil?
    raise ArgumentError unless right.parent.nil?

    new.tap do |root|
      root.depth = -1 # will be incremented with all other pairs
      root.left = left
      root.right = right

      left.parent = root
      left.parent_side = :left

      right.parent = root
      right.parent_side = :right

      root.traverse(:inorder_left) { _1.depth += 1 }
    end
  end

  def [](side)
    public_send(side)
  end

  def []=(side, value)
    public_send("#{side}=", value)
  end

  def to_a
    l = left.is_a?(Pair) ? left.to_a : left
    r = right.is_a?(Pair) ? right.to_a : right
    [l, r]
  end

  def dup
    Marshal.load(Marshal.dump(self))
  end

  def int?(direction)
    public_send(direction).is_a?(Integer)
  end

  def left_int?
    int?(:left)
  end

  def left_pair?
    not left_int?
  end

  def right_int?
    int?(:right)
  end

  def right_pair?
    not right_int?
  end

  def traverse(order, &visitor)
    case order
    when :inorder_left
      left.traverse(order, &visitor) if left_pair?
      visitor.(self)
      right.traverse(order, &visitor) if right_pair?
    when :inorder_right
      right.traverse(order, &visitor) if right_pair?
      visitor.(self)
      left.traverse(order, &visitor) if left_pair?
    when :preorder_left
      visitor.(self)
      left.traverse(order, &visitor) if left_pair?
      right.traverse(order, &visitor) if right_pair?
    else
      raise NotImplementedError, order.to_s
    end
    nil
  end

  def ==(other)
    to_a == other.to_a
  end

  def inspect
    "#<Pair #{to_a.inspect.gsub(', ', ',')}>"
  end

  def explode!
    raise "can't explode this: #{inspect}" unless left_int? && right_int?

    int_search(:left) do |n, side|
      n[side] += left
    end
    int_search(:right) do |n, side|
      n[side] += right
    end
    parent.public_send("#{parent_side}=", 0)

    nil
  end

  def int_search(direction)
    other_direction = (direction == :left ? :right : :left)
    subtree_order = "inorder_#{other_direction}".to_sym
    searched_side = nil
    n = self

    loop do
      searched_side = n.parent_side
      n = n.parent
      # pp [direction, searched_side, n]
      break if n.nil?
      if n.int?(direction)
        yield n, direction
        return
      elsif direction != searched_side
        n[direction].traverse(subtree_order) do |subn|
          if subn.int?(other_direction)
            yield subn, other_direction
            return
          end
        end
      end
    end

    nil
  end

  # To split a regular number, replace it with a pair; the left element of the
  # pair should be the regular number divided by two and rounded down, while the
  # right element of the pair should be the regular number divided by two and
  # rounded up. For example, 10 becomes [5,5], 11 becomes [5,6], 12 becomes
  # [6,6], and so on.
  def split!(side)
    raise ArgumentError, "bad split" unless int?(side)
    i = self[side]
    self[side] = Pair.new.tap do |child|
      child.depth = depth + 1
      child.parent = self
      child.parent_side = side
      child.left = i/2
      child.right = i - child.left
    end
    nil
  end
end

def assert(condition)
  raise "Assertion failed: #{condition}" unless eval(condition)
end

# To explode a pair, the pair's left value is added to the first regular number to
# the left of the exploding pair (if any), and the pair's right value is added to
# the first regular number to the right of the exploding pair (if any). Exploding
# pairs will always consist of two regular numbers. Then, the entire exploding
# pair is replaced with the regular number 0.
#
# Here are some examples of a single explode action:
#
#   [[[[[9,8],1],2],3],4] becomes [[[[0,9],2],3],4] (the 9 has no regular number to its left, so it is not added to any regular number).
#   [7,[6,[5,[4,[3,2]]]]] becomes [7,[6,[5,[7,0]]]] (the 2 has no regular number to its right, and so it is not added to any regular number).
#   [[6,[5,[4,[3,2]]]],1] becomes [[6,[5,[7,0]]],3].
#   [[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]] becomes [[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]] (the pair [3,2] is unaffected because the pair [7,3] is further to the left; [3,2] would explode on the next action).
#   [[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]] becomes [[3,[2,[8,0]]],[9,[5,[7,0]]]].
def explode!(n)
  n.traverse(:preorder_left) do |p|
    if p.depth == 4
      # puts "Explode #{p.inspect}"
      p.explode!
      return true
    end
  end

  false
end

def explode(n)
  n.dup.tap { explode!(_1) }
end

assert "explode(Pair.coerce([[[[[9,8],1],2],3],4])) == Pair.coerce([[[[0,9],2],3],4])"
assert "explode(Pair.coerce([7,[6,[5,[4,[3,2]]]]])) == Pair.coerce([7,[6,[5,[7,0]]]])"
assert "explode(Pair.coerce([[6,[5,[4,[3,2]]]],1])) == Pair.coerce([[6,[5,[7,0]]],3])"
assert "explode(Pair.coerce([[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]])) == Pair.coerce([[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]])"
assert "explode(Pair.coerce([[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]])) == Pair.coerce([[3,[2,[8,0]]],[9,[5,[7,0]]]])"

def split!(n)
  n.traverse(:inorder_left) do |pair|
    if pair.left_int? && pair.left >= 10
      # puts "Split left #{pair.inspect}"
      pair.split!(:left)
      return true
    elsif pair.right_int? && pair.right >= 10
      # puts "Split right #{pair.inspect}"
      pair.split!(:right)
      return true
    end
  end

  false
end

# To reduce a snailfish number, you must repeatedly do the first action in this list that applies to the snailfish number:
#
# - If any pair is nested inside four pairs, the leftmost such pair explodes.
# - If any regular number is 10 or greater, the leftmost such regular number splits.
#
# Once no action in the above list applies, the snailfish number is reduced.
def reduce!(n)
  loop do
    # pp n
    next if explode!(n)
    next if split!(n)
    # pp n
    return
  end
end

def reduce(n)
  n.dup.tap { reduce!(_1) }
end

def reduced?(n)
  n == reduce(n)
end

def add(n1, n2)
  p = Pair.coerce([n1.to_a, n2.to_a])
  reduce!(p)
  p
end

assert <<~RUBY
  add(
    Pair.coerce([[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]),
    Pair.coerce([7,[[[3,7],[4,3]],[[6,3],[8,8]]]]),
  ) == Pair.coerce([[[[4,0],[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]])
RUBY

def magnitude(n)
  return n if n.is_a?(Integer)

  3*magnitude(n.left) + 2*magnitude(n.right)
end

assert "magnitude(Pair.coerce([[9,1],[1,9]])) == 129"

DATA.read.split("\n")
  .map { |line| Pair.coerce(eval(line)) } # dont look
  .reduce { add(_1, _2) }
  .tap { pp magnitude(_1) }

__END__
[[1,[8,[5,8]]],[[4,4],[8,[8,8]]]]
[[[3,[2,3]],[[8,0],2]],[0,[[8,1],[7,0]]]]
[4,[[0,3],[[6,6],[3,8]]]]
[[[7,[6,4]],[[0,6],[2,0]]],[[[5,6],[0,4]],[[8,1],[9,1]]]]
[[[6,3],[[6,9],4]],[[1,[4,2]],[[0,0],1]]]
[[2,0],[3,[0,8]]]
[[0,[5,5]],[[4,2],[3,[6,4]]]]
[[[[9,9],[8,5]],[7,4]],[[6,9],[8,[0,8]]]]
[[[[7,1],[2,9]],[[9,3],0]],[3,[[0,6],[7,6]]]]
[[[[3,7],[7,1]],[[5,8],[0,1]]],3]
[[[[4,6],[6,2]],[[9,1],7]],[[9,1],[8,0]]]
[[[[2,7],0],[[9,4],[2,6]]],[0,[[7,4],[0,3]]]]
[[5,[[0,2],[8,8]]],[[[4,1],9],3]]
[[[7,1],[[3,7],[3,4]]],[[[0,7],[1,6]],1]]
[[[6,5],[[1,8],[8,8]]],[[4,5],[3,7]]]
[[[1,[3,3]],[[3,2],[5,7]]],[[8,[9,3]],[[5,3],4]]]
[[[4,[2,7]],9],[9,[[5,6],4]]]
[[[9,1],3],[[1,2],9]]
[[[[0,0],[2,3]],[[7,8],[1,5]]],[[[8,6],7],[[8,3],9]]]
[6,[[5,[0,8]],1]]
[4,[[[3,0],[2,0]],[[7,2],[1,4]]]]
[[[[4,3],[4,1]],8],[[[9,4],[1,9]],[4,[0,6]]]]
[4,[5,6]]
[[[0,[6,1]],[[6,1],3]],[[0,[7,8]],[1,0]]]
[[5,[[8,7],8]],8]
[[5,[[5,2],0]],[[1,[4,7]],[[0,9],[2,3]]]]
[[7,[2,2]],[[6,3],[5,8]]]
[[[0,9],5],[1,[[5,7],1]]]
[[8,[3,[0,3]]],[[[2,2],2],[[8,8],[8,9]]]]
[[6,[[3,2],[2,6]]],[5,1]]
[[[[9,8],[6,8]],[0,7]],7]
[[[7,2],[[6,3],4]],2]
[[[5,2],[[1,6],[8,3]]],[6,5]]
[[5,2],[0,5]]
[[[[4,5],5],[[4,6],[1,2]]],[[[3,6],[4,9]],[1,9]]]
[[1,[4,1]],[[9,[5,5]],[[9,0],[5,7]]]]
[[[[8,9],[7,7]],2],[8,1]]
[[[8,1],[8,[9,5]]],3]
[[[2,[3,9]],[[5,4],[7,9]]],[9,8]]
[8,[[2,[0,9]],[[5,0],4]]]
[[[6,[4,8]],[0,6]],[[8,[1,8]],1]]
[[6,[[1,0],[6,2]]],[[9,[3,7]],[5,[4,0]]]]
[[8,[0,[9,1]]],8]
[7,[4,[7,2]]]
[[1,[[5,7],[5,4]]],[[5,[8,0]],[1,6]]]
[[[[0,6],[6,2]],3],[[[9,3],7],[7,[1,2]]]]
[[[6,[4,9]],8],[6,5]]
[[[0,[1,9]],[[1,9],[3,9]]],[[[3,4],[7,5]],3]]
[[[[9,3],5],[[0,5],[2,7]]],9]
[[[6,[7,5]],5],[1,[[7,0],[3,4]]]]
[[[2,1],[[1,3],[1,5]]],[4,[9,[7,9]]]]
[[[[7,9],4],[[8,8],7]],[[[3,5],2],[[4,4],[6,5]]]]
[[1,1],[1,1]]
[[8,[0,2]],8]
[[[2,[2,1]],[[1,7],[1,2]]],[[1,6],5]]
[6,[0,[[1,0],[0,9]]]]
[6,[[2,[8,0]],[8,[8,8]]]]
[4,[[3,[0,3]],4]]
[[[5,3],3],[[0,[7,6]],[2,[5,8]]]]
[[[[8,1],[4,1]],[[5,8],[4,8]]],[[[1,7],[7,2]],[0,[2,7]]]]
[[[2,[3,5]],3],5]
[[7,[[9,5],[8,2]]],[[[1,8],8],5]]
[[3,5],[[4,[9,3]],5]]
[[[[4,6],2],[2,2]],[0,[0,4]]]
[[[[5,8],[6,6]],[2,0]],[[[2,3],9],[[4,5],2]]]
[[[[1,9],3],[[3,4],6]],[[3,6],[6,[0,7]]]]
[[[0,[5,5]],[2,6]],[[[7,4],4],2]]
[0,[[8,[6,2]],[5,[1,5]]]]
[[[[5,5],[9,6]],[[5,2],2]],[[4,7],[[5,5],[1,6]]]]
[[4,7],[[[1,8],[9,6]],[2,3]]]
[5,[5,4]]
[[[[2,1],[7,0]],[5,[7,8]]],[6,[3,1]]]
[[[3,1],[[2,4],6]],[[[1,8],[2,1]],[[1,7],4]]]
[[[5,[3,3]],6],[[[0,0],9],[1,[7,4]]]]
[[[6,5],[[7,3],4]],[[9,[0,3]],[3,[6,0]]]]
[[[3,4],7],[8,[[1,7],[9,9]]]]
[[[[2,1],6],[2,6]],[[[8,1],[6,2]],[9,0]]]
[[8,4],[5,2]]
[[4,[[4,5],9]],[[3,[5,2]],[4,2]]]
[[[8,8],[[8,0],[5,3]]],4]
[[1,8],[0,2]]
[[[[7,2],[9,0]],[[9,2],[1,2]]],[[[4,0],3],0]]
[[[[1,2],[1,8]],[[4,3],[8,6]]],[[[5,1],8],[8,1]]]
[[[[5,3],[7,2]],7],[[6,[7,9]],[[3,8],[9,4]]]]
[[[[3,1],[2,5]],6],[[[3,2],[8,8]],[4,6]]]
[9,[[3,[2,3]],6]]
[[[[4,0],[5,6]],[5,4]],[[[9,0],[1,8]],[5,[3,6]]]]
[[[[9,5],[9,4]],[[5,7],5]],[[[1,4],7],[6,1]]]
[[2,[6,[8,2]]],[7,[1,[3,3]]]]
[[[9,1],[0,[6,3]]],[[5,[1,5]],[7,[1,0]]]]
[1,6]
[[0,[2,[8,9]]],[[[4,5],[5,4]],1]]
[[[1,[4,1]],8],[[2,[7,0]],[7,[9,9]]]]
[[[[5,7],[3,5]],[[6,6],2]],[2,[8,[9,0]]]]
[6,[[[3,9],8],[[4,3],[6,1]]]]
[[[[6,7],[7,6]],[2,8]],[[9,[4,1]],6]]
[[[[4,5],[4,5]],[[0,6],5]],[[[6,5],[7,0]],1]]
[[[[6,7],9],[[5,5],[6,6]]],[[7,1],[[8,2],[3,1]]]]
[[[9,6],7],[[[1,8],8],[1,7]]]
[[5,2],[[1,9],[2,2]]]
