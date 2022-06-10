# frozen_string_literal: true

require "sidekiq"

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

require "sidekiq/web"
use Rack::Session::Cookie,
    secret: File.read(".session.key"),
    same_site: true,
    max_age: 86_400
run Sidekiq::Web
