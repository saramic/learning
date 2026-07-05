# frozen_string_literal: true

require "test_helper"

class SpeedOfLightTest < Hanami::Minitest::Test
  test "computes c from frequency and hot-spot spacing" do
    result = Calculator::SpeedOfLight.calculate(
      frequency_mhz: "2450",
      spot_distance_cm: "18.3",
      gap_count: "3"
    )

    assert_in_delta 6.1, result.avg_spacing_cm, 0.0001
    assert_in_delta 12.2, result.wavelength_cm, 0.0001
    assert_in_delta 298_900_000, result.speed_of_light_ms, 1
  end

  test "raises for non-positive input" do
    assert_raises(ArgumentError) do
      Calculator::SpeedOfLight.calculate(frequency_mhz: "2450", spot_distance_cm: "0", gap_count: "1")
    end
  end

  test "raises for non-numeric input" do
    assert_raises(ArgumentError) do
      Calculator::SpeedOfLight.calculate(frequency_mhz: "abc", spot_distance_cm: "18.3", gap_count: "3")
    end
  end
end
