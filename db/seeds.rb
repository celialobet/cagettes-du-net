# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Basket.destroy_all
Location.destroy_all

i = 0
10.times do 
  name = ['Le panier garni', 'Chez Suzette', 'Aux bons vins', 'Librairie-papeterie du marché', "Epicerie équitable - Paris 17", "Hotel de la Gare", "Koala Coworking", "Slow café", "U pilu - Spécialités corses", "Marie Fleurs"]
  rue = ['Rue Abel', 'Rue Abel-Gance', 'Rue Abel-Hovelacque', 'Rue Abel-Rabaud', 'Rue Abel-Truchet', 'Rue Achille', 'Rue Achille-Luchaire', 'Rue Achille-Martinet', 'Rue Adolphe-Adam', 'Rue Adolphe-Jullien']
  zip = [75012, 75013, 75013, 75011, 75017, 75020, 75014, 75018, 75004, 75001]
  days = ['lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi']
  Location.create(name: name[i], address_number: rand(1..10), address_street: rue[i], address_city: 'Paris', zip_code: zip[i], description: Faker::Lorem.paragraph, day: days.sample, time: Time.now, opening_hours: "10h-20h", validated: true)
  i = i + 1
end

basket_1 = Basket.create(title: "Petite cagette mélangée", description: "Voici un petit panier pour 1 à 2 petits mangeurs de fruits et légumes. Idéal pour découvrir nos meilleurs produits frais ! :)", price: 9.99)
basket_1.image_url.attach(io:File.open("app/assets/images/basket_1_petite_cagette_melangee.jpeg"), filename: "basket_1_petite_cagette_melangee.jpeg")

basket_2 = Basket.create(title: "Petit cagette de fruit", description: "Voici un petit panier pour 1 à 2 fruits-addict. Idéal pour compléter vos achats de la semaine et déguster de bons fruits de saison !", price: 9.99)
basket_2.image_url.attach(io:File.open("app/assets/images/basket_2_petite_cagette_de_fruits.jpeg"), filename: "basket_1_petite_cagette_de_fruits.jpeg")

basket_3 = Basket.create(title: "Cagette moyenne mélangée", description: "Avec cette cagette de 5kg environ, vous aurez de quoi régaler 3 à 4 personnes avec des produits variés... jusqu'à votre commande de la semaine prochaine ;)", price: 14.99)
basket_3.image_url.attach(io:File.open("app/assets/images/basket_3_cagette_moyenne_melangee.jpeg"), filename: "basket_3_cagette_moyenne_melangee.jpeg")

basket_4 = Basket.create(title: "Cagette moyenne de fruit", description: "5kg de fruits pour une petite famille (ou rien que pour vous!), pour mettre du soleil dans votre verre en hiver et faire de belles tartes aux fraises en été!", price: 14.99)
basket_4.image_url.attach(io:File.open("app/assets/images/basket_4_cagette_moyenne_de_fruits.jpeg"), filename: "basket_4_cagette_moyenne_de_fruits.jpeg")

basket_5 = Basket.create(title: "Grande cagette mélangée", description: "Pour les familles nombreuses (ou les cantines scolaires), entre 7 et 9kg de fruits et légumes par semaine pour une cuisine toujours plus variée et colorée ! Et avec un tarif réduit en prime pour vous remercier !", price: 19.99)
basket_5.image_url.attach(io:File.open("app/assets/images/basket_5_grande_cagette_melangee.jpeg"), filename: "basket_5_grande_cagette_melangee.jpeg")

