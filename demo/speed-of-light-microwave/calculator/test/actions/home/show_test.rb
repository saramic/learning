# frozen_string_literal: true

require "test_helper"

class Calculator::Actions::Home::ShowTest < Hanami::Minitest::Test
  test "works" do
    params = {}
    response = Calculator::Actions::Home::Show.new.call(params)
    assert_predicate response, :successful?
  end
end
