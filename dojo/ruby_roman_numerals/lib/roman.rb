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
      NUMERALS.keys.reverse.each do |key_arabic|
        return NUMERALS[key_arabic] if arabic == key_arabic
      end
      Array.new(arabic, 'I').join
    end
  end
end
