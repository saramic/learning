class Roman
  class << self
    def from_arabic(arabic)
      Array.new(arabic, 'I').join
    end
  end
end
