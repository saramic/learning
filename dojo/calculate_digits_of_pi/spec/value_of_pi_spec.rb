require "value_of_pi"
require "bigdecimal"

describe ValueOfPi do
  it "returns the value of pi using calculation" do
    expect(ValueOfPi.value(to_digits: 8)).to eq 3.14159265
  end

  it "returns the value of pi using calculation to 100 decimal places" do
    expect(
      ValueOfPi.value(to_digits: 100)
    ).to be_within(0.00000000000000002).of(BigDecimal("3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679"))
  end

  it "returns the value of pi using calculation to 100 decimal places" do
    expect(
      ValueOfPi.value(to_digits: 100)
    ).to be_within(
      0.0000000000000000000000000000000000003
    ).of(
      BigDecimal(
        "3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679"
      )
    )
  end

  it "returns the value of pi using calculation to 100 decimal places" do
    pending "not yet"
    expect(
      ValueOfPi.value(to_digits: 100)
    ).to eq(
      BigDecimal(
        "3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679"
      )
    )
  end

  it "returns the value of pi using calculation" do
    expect(
      ValueOfPi.value(to_digits: 15)
    ).to be_within(0.000000001).of(3.14159265358979323)
    #                                             ^
  end

  it "returns the value of pi using math" do
    value_of_pi = ValueOfPi.new
    expect(
      value_of_pi.calculate_pi_using_math
    ).to be_within(0.000000000000001).of(3.14159265358979323)
    #                                                     ^
  end

  it "returns the value of pi using constant" do
    value_of_pi = ValueOfPi.new
    expect(
      value_of_pi.calculate_pi_using_math
    ).to be_within(0.0000000000000003).of(BigDecimal("3.141592653589793238462643383279502884197169399375105820974944592307816406286"))
  end
end
