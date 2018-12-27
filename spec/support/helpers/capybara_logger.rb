# frozen_string_literal: true

def show_js_logs
  Capybara::Chromedriver::Logger::TestHooks.for_rspec!
end
