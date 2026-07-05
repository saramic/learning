# frozen_string_literal: true

require "hanami/boot"
require "rack/static"

use Rack::Static, urls: ["/images", "/js"], root: "public", cache_control: "public, max-age=86400"

run Hanami.app
