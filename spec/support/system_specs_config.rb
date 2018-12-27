# frozen_string_literal: true

require 'action_dispatch/system_testing/server'
ActionDispatch::SystemTesting::Server.silence_puma = true

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    driven_by :headless_chrome
  end
end
