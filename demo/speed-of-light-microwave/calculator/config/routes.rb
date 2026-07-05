# frozen_string_literal: true

module Calculator
  class Routes < Hanami::Routes
    root to: "home.show"
    post "/", to: "home.show"
  end
end
