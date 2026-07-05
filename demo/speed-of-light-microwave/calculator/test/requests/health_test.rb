# frozen_string_literal: true

require "test_helper"

class HealthTest < Hanami::Minitest::RequestTest
  test "responds ok, for Kamal's proxy healthcheck" do
    get "/up"

    assert_equal 200, last_response.status
  end
end
