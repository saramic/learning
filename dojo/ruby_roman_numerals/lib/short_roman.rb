class ShortRoman
  class << self
    NUMERALS = {
      1 => 'I',
      4 => 'IV',
      5 => 'V',
      9 => 'IX',
      10 => 'X',
      40 => 'XL',
      50 => 'L',
      90 => 'XC',
      100 => 'C',
      400 => 'CD',
      500 => 'D',
      900 => 'CM',
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
      result.join
    end
  end
end
