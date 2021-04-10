# frozen_string_literal: true

FactoryBot.define do
  factory :animal do
    name_owner { Faker::Name.name_with_middle }
    phone_owner { Faker::PhoneNumber.cell_phone }
    name { Faker::Name.name_with_middle }
    description { Faker::Lorem.paragraph }
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    country { Faker::Address.country }
    neighborhood { Faker::Address.full_address }
    state { Faker::Address.state }
    number { Faker::Address.building_number }
    zipcode { Faker::Address.zip_code }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    user factory: :user
    category factory: :category
  end
end
