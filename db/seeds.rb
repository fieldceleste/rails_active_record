# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destory_all
# Review.destory_all

#-------------Faker for Products ----------------->
50.times do |index|
  product = Product.create!(name: Faker::Food.ingredient,
    cost: Faker::Number.decimal(l_digits: 2),
    country_of_origin: Faker::Address.country)
    # image_url: "food.png")
  


end
 
p "Created #{Product.count} products"

#------------Faker for Reviews ----------------------->