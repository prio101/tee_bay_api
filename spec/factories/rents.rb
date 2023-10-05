FactoryBot.define do
  factory :rent do
    start_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    end_date { Faker::Date.between(from: Date.today, to: 1.month.from_now) }
    user
    product
  end
end
