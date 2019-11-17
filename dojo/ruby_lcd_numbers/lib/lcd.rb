class Lcd
  def self.d(number)
    if number == 3
      <<-EO_DIGIT.gsub(/^( ){7}/, "")
        --
          |
        --
          |
        --
    EO_DIGIT
    else
      <<-EO_DIGIT.gsub(/^(  )+/, "")
       --
      |  |
       --
      |  |
       --
    EO_DIGIT
    end
  end
end
