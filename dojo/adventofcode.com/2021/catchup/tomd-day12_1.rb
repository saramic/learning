#!/usr/bin/env ruby -Ilib

require 'set'
require 'byebug'

class Node
  attr_reader :name, :neighbours

  def initialize(name)
    @name = name
    @neighbours = Set.new
  end

  def small?
    type == :small
  end

  def big?
    type == :big
  end

  def end?
    name == "end"
  end

  def type
    if name.downcase == name
      :small
    else
      :big
    end
  end

  def inspect
    "#<#{self.class} #{name} neighbours=#{neighbours.map(&:name).inspect}>"
  end
end

class Graph
  def initialize
    @nodes = {}
    @paths_to_end = {}
  end

  def node(name)
    if @nodes.key?(name)
      @nodes.fetch(name)
    else
      @nodes[name] = Node.new(name)
    end
  end

  def nodes
    @nodes.values
  end

  def connect_nodes(name1, name2)
    n1 = node(name1)
    n2 = node(name2)

    n1.neighbours << n2
    n2.neighbours << n1
    nil
  end

  def walks_to_end(from_node: node("start"), current_path: [])
    return [current_path + [from_node]] if from_node.end?
    return [] if from_node.small? && current_path.include?(from_node)

    new_current_path = current_path + [from_node]
    from_node.neighbours.flat_map do |neighbour|
      walks_to_end(from_node: neighbour, current_path: new_current_path)
    end.uniq
  end

  def parent_first_traversal_from(node_name)
    done_nodes = Set.new
    remaining_nodes = [node(node_name)]

    until remaining_nodes.empty?
      n = remaining_nodes.shift
      next if done_nodes.include?(n)

      yield n
      done_nodes << n
      remaining_nodes.concat(n.neighbours.reject { done_nodes.include?(_1) })
    end

    nil
  end
end

graph = Graph.new
DATA.read.split("\n").each do |lines|
  n1, n2 = lines.strip.split('-')
  graph.connect_nodes(n1, n2)
end

paths =
  graph.walks_to_end.map do |path|
    path.map(&:name)
  end

puts(paths.map { _1.join(" -> ") }.sort)
puts paths.size

__END__
re-js
qx-CG
start-js
start-bj
qx-ak
js-bj
ak-re
CG-ak
js-CG
bj-re
ak-lg
lg-CG
qx-re
WP-ak
WP-end
re-lg
end-ak
WP-re
bj-CG
qx-start
bj-WP
JG-lg
end-lg
lg-iw
