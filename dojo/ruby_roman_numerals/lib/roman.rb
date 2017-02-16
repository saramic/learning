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
        NUMERALS.keys.reverse.select{|k| k < key_arabic}.each do |sub_key_arabic|
          if arabic >= (3*sub_key_arabic) && arabic + sub_key_arabic >= key_arabic
            arabic += sub_key_arabic
            arabic -= key_arabic
            result << [NUMERALS[sub_key_arabic], NUMERALS[key_arabic]]
          end
        end
      end
      result.join
    end
  end
end
