FactoryBot.define do
  factory :order do
    status { "ordered" }
    total { Faker::Commerce.price }
    user
  end
end
