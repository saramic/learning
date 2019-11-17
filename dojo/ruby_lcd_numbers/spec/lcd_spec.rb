RSpec.describe Lcd do
  it "displays 8" do
    result = <<-EO_DIGIT.gsub(/^( ){6}/, "")
       -- 
      |  |
       -- 
      |  |
       -- 
    EO_DIGIT
    expect(Lcd.d(8)).to eq(result)
  end

  it "displays 3" do
    result = <<-EO_DIGIT.gsub(/^( ){6}/, "")
       -- 
         |
       -- 
         |
       -- 
    EO_DIGIT
    expect(Lcd.d(3)).to eq(result)
  end

  it "displays 38" do
    result = <<-EO_DIGIT.gsub(/^( ){6}/, "")
       --    -- 
         |  |  |
       --    -- 
         |  |  |
       --    -- 
    EO_DIGIT
    expect(Lcd.d(38)).to eq(result)
  end
end
