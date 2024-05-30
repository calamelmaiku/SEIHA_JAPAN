FactoryBot.define do
  factory :group do
    name { Faker::Lorem.word }
    creator { Faker::Name.name }
    text { Faker::Lorem.sentence }
  end
end
