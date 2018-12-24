# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.3"

gem "bootsnap", ">= 1.1.0", require: false
gem "devise"
gem "haml-rails"
gem "pg"
gem "puma"
gem "pundit"
gem "rails", "~> 5.2.2"
gem "redis"
gem "rubocop"
gem "sass-rails"
gem "coffee-rails"
gem "jquery-rails"
gem "uglifier"
gem "bootstrap-sass"
gem "font-awesome-rails"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot"
  gem "faker"
end

group :development do
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen"
  gem "web-console"
end

group :test do
  gem "rails-controller-testing"
  gem "rspec-rails"
  gem "shoulda-matchers", "4.0.0.rc1"
end
