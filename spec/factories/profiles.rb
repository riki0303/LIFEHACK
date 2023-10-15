FactoryBot.define do
  factory :profile do
    name { Faker::Lorem.characters(number: 10) }
    bio { Faker::Lorem.characters(number: 100) }
  end
end
