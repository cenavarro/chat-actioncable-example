# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  # Uncomment this after config selenium and using with system specs with javascript
  # config.before(:each, type: :system, js: true) do
  #   driven_by :selenium_chrome_headless
  # end
end
