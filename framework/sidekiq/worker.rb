# frozen_string_literal: true

require "sidekiq"

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class OurWorker
  include Sidekiq::Worker

  def perform(complexity)
    case complexity
    when "super_hard"
      puts "Charging credit card ..."
      raise "Woops stuff got bad" if ENV.fetch("SIDEKIQ_DEMO_W_EXCEPTION", nil)

      sleep 20
      puts "Really took quite a bit of effort"
    when "hard"
      sleep 10
      puts "That was a bit of work"
    else
      while ENV.fetch("SIDEKIQ_DEMO_W_EASY_ERROR", nil)
        sleep 1
        puts "zomg bug"
      end
      sleep 1
      pp ENV.fetch("SIDEKIQ_DEMO_W_EASY_ERROR", nil)
      puts "That wasn't a lot of effort"
    end
    pp ENV.fetch("SIDEKIQ_DEMO_W_EASY_ERROR", nil)
  end
end
