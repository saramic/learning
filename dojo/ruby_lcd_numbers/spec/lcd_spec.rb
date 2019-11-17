RSpec.describe Lcd do
  it "displays 8" do
    result = <<-EO_DIGIT
 --
|  |
 --
|  |
 --
 EO_DIGIT
    expect(Lcd.d(8)).to eq(result)
  end

  it "displays 3" do
    result = <<-EO_DIGIT
 --
   |
 --
   |
 --
 EO_DIGIT
    expect(Lcd.d(3)).to eq(result)
  end
end
