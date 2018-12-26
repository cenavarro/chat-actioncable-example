# frozen_string_literal: true

FactoryBot.define do
  factory :chat do
    name { Faker::FunnyName.name }
  end
end
