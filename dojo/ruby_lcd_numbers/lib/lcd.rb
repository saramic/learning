require "digits"

class Lcd
  def self.d(number)
    output = Array.new(5, "")
    for line_index in 0..4
      output[line_index] = number.to_s.chars.map do |digit|
        NUMBERS[digit].split("\n")[line_index]
      end.join("  ")
    end

    output.join("\n") + "\n"
  end
end
