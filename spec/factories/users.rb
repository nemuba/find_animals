# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    email  { Faker::Internet.email }
    password { "123456789" }
    password_confirmation { "123456789" }
  end
end
