FactoryBot.define do
  factory :role do
    sequence(:name) { |n| "role#{n}" }
    value { "admin" }
  end
end
