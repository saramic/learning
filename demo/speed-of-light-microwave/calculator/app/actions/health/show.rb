# frozen_string_literal: true

module Calculator
  module Actions
    module Health
      class Show < Calculator::Action
        def handle(request, response)
          response.body = "ok"
        end
      end
    end
  end
end
