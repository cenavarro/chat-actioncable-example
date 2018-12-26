# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.3"

gem "aws-sdk-s3", require: false
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-sass"
gem "coffee-rails"
gem "devise"
gem "font-awesome-rails"
gem "gon"
gem "haml-rails"
gem "jquery-rails"
gem "mini_magick"
gem "pg"
gem "puma"
gem "pundit"
gem "rails", "~> 5.2.2"
gem "redis"
gem "sass-rails"
gem "uglifier"

group :development, :test do
  gem "action-cable-testing"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-rails"
  gem "rubocop"
end

group :development do
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen"
end

group :test do
  gem "capybara"
  gem "launchy"
  gem "rails-controller-testing"
  gem "rspec-rails"
  gem "shoulda-matchers", "4.0.0.rc1"
  gem "simplecov", require: false
end
