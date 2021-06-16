# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Basket.destroy_all
AdditionalProduct.destroy_all
Location.destroy_all
i = 0
10.times do 
  rue = ['Rue Abel', 'Rue Abel-Gance', 'Rue Abel-Hovelacque', 'Rue Abel-Rabaud', 'Rue Abel-Truchet', 'Rue Achille', 'Rue Achille-Luchaire', 'Rue Achille-Martinet', 'Rue Adolphe-Adam', 'Rue Adolphe-Jullien']
  zip = [75012, 75013, 75013, 75011, 75017, 75020, 75014, 75018, 75004, 75001]
  days = ['lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi']
  Location.create(name:Faker::Fantasy::Tolkien.location, address_number: rand(1..10), address_street: rue[i], address_city: 'Paris', zip_code: zip[i], description: Faker::Lorem.paragraph, day: days.sample, time: Time.now, opening_hours: "10h-20h", validated: true)
  i = i + 1
end

5.times do
  zip = [75001,75002,75003,75004,75005,75006,75007,75008,75009,75010,75011,75012,75013,75014,75015,75016,75017,75018,75019,75020]
  User.create(first_name: Faker::Games::Pokemon.name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456', zip_code: 75011, location: Location.all.sample)
end

5.times do
  i += 1  
  Basket.create(title: "Panier #{i}", description: Faker::Lorem.paragraph, price: ((i+10)
end

10.times do
  AdditionalProduct.create(title: Faker::Food.ingredient, description: Faker::Lorem.paragraph, price: rand(1..8), is_available: Faker::Boolean.boolean(true_ratio: 0.8))
end