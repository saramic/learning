class Roman
  def self.from_arabic(arabic)
    arabic >= 1 ? ('I' * arabic) : ''
  end
end

