FactoryBot.define do
  factory :visited do
    association :user
    association :spot
    visited { false }
  end
end