class Roman
  class << self
    NUMERALS = {
      1 => 'I',
      5 => 'V',
      10 => 'X',
      50 => 'L',
      100 => 'C',
      500 => 'D',
      1000 => 'M'
    }

    def from_arabic(arabic)
      result = []
      NUMERALS.keys.reverse.each do |key_arabic|
        while arabic >= key_arabic
          arabic -= key_arabic
          result << NUMERALS[key_arabic]
        end
      end
      #Array.new(arabic, 'I').join
      result.join
    end
  end
end
