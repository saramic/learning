# frozen_string_literal: true

module Calculator
  class Routes < Hanami::Routes
    root to: "intro.show"
    get "/standing-waves", to: "standing_waves.show"
    get "/gallery", to: "gallery.show"
    get "/calculator", to: "home.show"
    post "/calculator", to: "home.show"

    # Kamal's proxy hits this before routing traffic to a new container.
    get "/up", to: "health.show"
  end
end
