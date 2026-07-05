# frozen_string_literal: true

require "test_helper"

class GalleryTest < Hanami::Minitest::RequestTest
  test "shows the photo gallery with lightbox targets" do
    get "/gallery"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "01_experiment_setup.jpg"
    assert_includes last_response.body, 'id="photo-1"'
  end
end
