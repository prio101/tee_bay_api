# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = ['ELECTRONICS', 'FURNITURE', 'HOME APPLIANCES', ' SPORTING GOODS', 'OUTDOOR', 'TOYS']
# categories.each do |category|
#   Category.create(name: category,
#                   description: "This is a #{category} category",
#                   value: category.downcase.humanize)
# end


5.times do
  Product.create(title: Faker::Commerce.product_name,
                 description: Faker::Lorem.paragraph,
                 price: Faker::Commerce.price)
end

5.times do
  Order.create(product_id: Product.all.sample.id,
               user_id: User.all.sample.id,
               total: Faker::Commerce.price,
               status: "ordered")
end


5.times do
  Rent.create( status: "rented",
               price: Faker::Commerce.price,
               user_id: User.all.sample.id,
               product_id: Product.all.sample.id,
               start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
               end_date: Faker::Date.between(from: Date.today, to: 1.year.from_now))
end


5.times do
  Role.create(name: Faker::Job.title, value: Faker::Job.title.downcase.humanize)
end
