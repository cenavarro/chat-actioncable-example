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
gem "uglifier"

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
  gem "rspec-rails"
end
