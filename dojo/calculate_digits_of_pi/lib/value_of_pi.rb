require "bigdecimal"

class ValueOfPi
  def self.value(to_digits: 10)
    value_of_pi = ValueOfPi.new
    value_of_pi.value(to_digits:)
  end

  def initialize
    @pi = calculate_pi
  end

  def value(to_digits:)
    @pi.round(to_digits)
  end

  def calculate_pi_using_math
    (16.0 * Math.atan(1.0/5)) -
      (4.0 * Math.atan(1.0/239))
  end

  def calculate_pi_using_const
    Math::PI
  end

  def calculate_pi
    (16.0 * arctan(denominator: 5)) -
      (4.0 * arctan(denominator: 239))
  end

  def arctan(denominator:)
    # (1..23) # within 16 decimal places - with float denominator
    (1..50)
      .step(2)
      .with_index
      .reduce(BigDecimal("0")) do |accum, (step, index)|
      value = 1.0/(step*(power(BigDecimal("#{denominator}"), step)))
      index.odd? ? (accum - value) : (accum + value)
    end
    # 1.0/denominator
    #   - 1.0/(3*(denominator.pow(3)))
    #   + 1.0/(5*(denominator.pow(5)))
    #   - 1.0/(7*(denominator.pow(7)))
    #   + 1.0/(9*(denominator.pow(9)))
    #   - 1.0/(11*(denominator.pow(11)))
  end

  def power(base, exponent)
    (1..exponent).reduce(1){|acc, _index| acc * base}
  end
end
