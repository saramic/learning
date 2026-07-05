# frozen_string_literal: true

require "test_helper"

class StandingWavesTest < Hanami::Minitest::RequestTest
  test "shows the standing waves explainer" do
    get "/standing-waves"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "standing-wave-diagram.svg"
  end
end
