# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    chat
    user
    body { Faker::Lorem.sentence }
  end
end
