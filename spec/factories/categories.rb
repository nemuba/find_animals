# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    description { Faker::Name.name_with_middle }
  end
end
