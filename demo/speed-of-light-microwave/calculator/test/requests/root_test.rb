# frozen_string_literal: true

require "test_helper"

class RootTest < Hanami::Minitest::RequestTest
  test "shows the form" do
    get "/"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "Speed of Light Calculator"
  end

  test "calculates the speed of light from valid measurements" do
    post "/", frequency_mhz: "2450", spot_distance_cm: "18.3", gap_count: "3"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "2.9890e+08 m/s"
  end

  test "shows an error message for invalid measurements" do
    post "/", frequency_mhz: "abc", spot_distance_cm: "xyz", gap_count: "1"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "Please enter valid positive numbers"
  end
end
