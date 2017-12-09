class Parser
  attr_reader :score, :count

  def initialize(input)
    @input = input
    @score = 0
    @count = 0
    groups
  end

  def groups
    groups = []
    in_garbage = false
    last_char = ''
    depth = 0
    last_garbage = false
    @input.chars.each_with_index do |char, index|
      if in_garbage and last_char == '!'
        last_char = ''
        next
      end
      in_garbage = true if char == '<'
      in_garbage = false if char == '>'
      @count += 1 if in_garbage && (last_garbage == true || (last_garbage == false && char != '<')) && char != '!'
      last_garbage = in_garbage
      unless in_garbage
        if char == '{' # open
          groups << index
          depth += 1
        end
        if char == '}' # close
          @score += depth
          depth -= 1
        end
      end
      last_char = char
    end
    groups
  end

end

