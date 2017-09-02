class Letter
  CHARS = ('A'..'Z').to_a

  def initialize(char)
    @letter = char
  end

  def diamond
    index = CHARS.index(@letter)
    lines = (0..index).map do |line_index|
      line(index+1, line_index)
    end
    lines << lines.slice(0, lines.length-1).reverse unless index == 0
    "#{lines.join("\n")}\n"
  end

  def line(index, line_index)
    line = ('.' * (index + (index - 1)))
    line[(index-1) - line_index] = CHARS[line_index]
    line[(index-1) + line_index] = CHARS[line_index]
    line
  end
end
