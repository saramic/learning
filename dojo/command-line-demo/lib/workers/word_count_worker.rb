# frozen_string_literal: true

require "sidekiq"

$LOAD_PATH << File.join(File.dirname(__FILE__), '../../lib')
require "word_count"

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class WordCountWorker
  include Sidekiq::Worker

  def perform(filename)
    pp({filename: ::WordCount::Counter.word_count(filename)})
  end
end
