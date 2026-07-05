# frozen_string_literal: true

module Calculator
  class Routes < Hanami::Routes
    root to: "home.show"
    post "/", to: "home.show"

    # Kamal's proxy hits this before routing traffic to a new container.
    get "/up", to: "health.show"
  end
end
