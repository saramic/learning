class Roman
  NUMERALS = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV'
  }
  def self.from_arabic(arabic)
    acc = NUMERALS.keys.map do |key|
      if arabic >= key
        arabic -= key
        NUMERALS[key]
      end
    end
    acc << ('I' * arabic if arabic >= 1)
    acc.join
  end
end

