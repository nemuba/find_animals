FactoryBot.define do
  factory :category do
    description { Faker::Name.name_with_middle }
    user_id { create(:user).id }
  end
end