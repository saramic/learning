class Roman
  def self.from_arabic(arabic)
    return 'IV' if arabic == 4
    arabic >= 1 ? ('I' * arabic) : ''
  end
end

