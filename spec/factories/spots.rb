FactoryBot.define do
  factory :spot do
    name { Faker::Lorem.word }
    text { Faker::Lorem.sentence }
    address { Faker::Address.street_address }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    association :group
  end
end