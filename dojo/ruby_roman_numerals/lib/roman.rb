class Roman
  class << self
    NUMERALS = {1 => 'I', 5 => 'V'}

    def from_arabic(arabic)
      return NUMERALS[arabic] if arabic == 5
      Array.new(arabic, 'I').join
    end
  end
end
