class Lcd
  THREE = [
    " -- ",
    "   |",
    " -- ",
    "   |",
    " -- ",
  ].join("\n")

  EIGHT = [
    " -- ",
    "|  |",
    " -- ",
    "|  |",
    " -- ",
  ].join("\n")

  NUMBERS = [0, 1, 2, THREE, 4, 5, 6, 7, EIGHT, 9]

  def self.d(number)
    output = Array.new(5, "")
    for line_index in 0..4
      output[line_index] = number.to_s.chars.map do |digit|
        NUMBERS[digit.to_i].split("\n")[line_index]
      end.join("  ")
    end
    output.join("\n") + "\n"
  end
end
