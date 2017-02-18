class Roman
  NUMERALS = {
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

