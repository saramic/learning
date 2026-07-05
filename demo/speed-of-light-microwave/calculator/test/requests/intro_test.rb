# frozen_string_literal: true

require "test_helper"

class IntroTest < Hanami::Minitest::RequestTest
  test "shows the landing page" do
    get "/"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "Rubbury"
    assert_includes last_response.body, "c = f"
  end
end
