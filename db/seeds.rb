# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



#-------------Faker for Products ----------------->
Product.destroy_all

50.times do |index|
    Product.create!(name: Faker::Food.ingredient,
    cost: Faker::Number.decimal(l_digits: 2),
    country_of_origin: Faker::Address.country)

end 
p "Created #{Product.count} products"


 #------------Faker for Reviews ----------------------->
Review.destroy_all

250.times do |index|
     products = Product.all
     Review.create!(author: Faker::FunnyName.name_with_initial,
     content_body: Faker::Restaurant.review[0..249],
     rating: Faker::Number.between(from: 1, to: 5),
     product_id: products.sample.id)
end

 
p "Created #{Review.count} reviews."

