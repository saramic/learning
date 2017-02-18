class Roman
  NUMERALS = {
    4 => 'IV',
    5 => 'V'
  }
  def self.from_arabic(arabic)
    return NUMERALS[arabic] if NUMERALS.key?(arabic)
    arabic >= 1 ? ('I' * arabic) : ''
  end
end

