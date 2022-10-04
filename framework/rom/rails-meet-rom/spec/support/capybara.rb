# frozen_string_literal: true

require "capybara/rspec"
require "capybara/rails"

Capybara.javascript_driver = :selenium_chrome

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  args = {browser: :chrome}
  args[:options] = options if options
  Capybara::Selenium::Driver.new(
    app,
    **args,
  )
end

Capybara.add_selector(:qa) do
  css { |name| %([data-testid="#{name}"]) }
end
