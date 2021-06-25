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
Location.destroy_all
Selection.destroy_all
AdditionalProduct.destroy_all
Order.destroy_all
Delivery.destroy_all
Cart.destroy_all
Subscription.destroy_all

i = 0
10.times do 
  name = ['Le panier garni', 'Chez Suzette', 'Aux bons vins', 'Librairie-papeterie du marché', "Epicerie équitable - Paris 17", "Hotel de la Gare", "Koala Coworking", "Slow café", "U pilu - Spécialités corses", "Marie Fleurs"]
  rue = ['Rue Abel', 'Rue Abel-Gance', 'Rue Abel-Hovelacque', 'Rue Abel-Rabaud', 'Rue Abel-Truchet', 'Rue Achille', 'Rue Achille-Luchaire', 'Rue Achille-Martinet', 'Rue Adolphe-Adam', 'Rue Adolphe-Jullien']
  zip = [75012, 75013, 75013, 75011, 75017, 75020, 75014, 75018, 75004, 75001]
  days = ['lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi']
  Location.create(name: name[i], address_number: rand(1..10), address_street: rue[i], address_city: 'Paris', zip_code: zip[i], description: Faker::Lorem.paragraph, day: days.sample, time: rand(8..19), opening_hours: "10h-20h", validated: true)
  i = i + 1
end


basket_1 = Basket.create(title: "Petite cagette mélangée", description: "Voici un petit panier pour 1 à 2 petits mangeurs de fruits et légumes. Idéal pour découvrir nos meilleurs produits frais ! :)", price: 9.99, stripe_price: "price_1J540VGYs66l4gchNLcNhx9U")
basket_1.image_url.attach(io:File.open("app/assets/images/basket_1_petite_cagette_melangee.jpeg"), filename: "basket_1_petite_cagette_melangee.jpeg")

basket_2 = Basket.create(title: "Petite cagette de fruit", description: "Voici un petit panier pour 1 à 2 fruits-addict. Idéal pour compléter vos achats de la semaine et déguster de bons fruits de saison !", price: 9.99, stripe_price: "price_1J541KGYs66l4gchfXhWhnAW")
basket_2.image_url.attach(io:File.open("app/assets/images/basket_2_petite_cagette_de_fruits.jpeg"), filename: "basket_1_petite_cagette_de_fruits.jpeg")

basket_3 = Basket.create(title: "Cagette moyenne mélangée", description: "Avec cette cagette de 5kg environ, vous aurez de quoi régaler 3 à 4 personnes avec des produits variés... jusqu'à votre commande de la semaine prochaine ;)", price: 14.99, stripe_price: "price_1J5429GYs66l4gchl99sFRRF")
basket_3.image_url.attach(io:File.open("app/assets/images/basket_3_cagette_moyenne_melangee.jpeg"), filename: "basket_3_cagette_moyenne_melangee.jpeg")

basket_4 = Basket.create(title: "Cagette moyenne de fruit", description: "5kg de fruits pour une petite famille (ou rien que pour vous!), pour mettre du soleil dans votre verre en hiver et faire de belles tartes aux fraises en été!", price: 14.99, stripe_price: "price_1J542kGYs66l4gchMonfwfd7")
basket_4.image_url.attach(io:File.open("app/assets/images/basket_4_cagette_moyenne_de_fruits.jpeg"), filename: "basket_4_cagette_moyenne_de_fruits.jpeg")

basket_5 = Basket.create(title: "Grande cagette mélangée", description: "Pour les familles nombreuses (ou les cantines scolaires), entre 7 et 9kg de fruits et légumes par semaine pour une cuisine toujours plus variée et colorée ! Et avec un tarif réduit en prime pour vous remercier !", price: 19.99, stripe_price: "price_1J543UGYs66l4gch1ZrQCmJc")
basket_5.image_url.attach(io:File.open("app/assets/images/basket_5_grande_cagette_melangee.jpeg"), filename: "basket_5_grande_cagette_melangee.jpeg")

i = 1
30.times do
  title = ["Oeufs bio", "Huile d'olive", "Huile de colza", 'Vinaigre de vin', 'Vinaigre balsamique', "Sel & poivre", "Herbes de provence", "Basilic", "Basilic en pot", "Persil", "Gousses d'ail", "Échalottes", "Beurre doux", "Beurre demi-sel", "Lait", "Pack de lait", "Crème fraiche", "Moutarde de Dijon", "Moutarde à l'ancienne", "Tomates séchées", "Sauce tomate", "2 steak hachés", "2 tartares de boeufs", "2 pavés de saumon", "Truite fumée", "Jambon blanc", "Jambon cru", "Saucisson", "Chorizo", "Pâté de campagne"]
  description= ['Oeufs bio direct producteur x6', "Huile d'olive bio - 1L", "Huile de colza - 1L", 'Vinaigre de vin - 75cl', 'Vinaigre balsamique - 75cl', "Deux petites salières et poivrières en cas d'urgence", "1 petit sachet d'herbes de provence (50g)", "1 bouquet de feuilles de basilic (env. 40g)", "1 plant de basilic dans son pot, à gorger d'eau et de soleil!", "1 bouquet de branches de persil (env. 40g)", "Quelques gousses d'ail (env. 4, pour env. 40g) pour relever vos plats juste comme il faut", "Quelques échalottes (env. 4, pour env. 40g) pour compléter", "1 plaquette (250g) de beurre doux", "1 plaquette (250g) de beurre demi-sel", '1 bouteille de lait demi-écrémé (1L)', '1 pack de 6 bouteilles (1L) de lait demi-écrémé', '1 petit pot (250g) de crème fraiche', "1 pot de 100g de moutarde de Dijon classique", "1 pot de 100g de moutarde à l'ancienne", "1 petit bocal(250g) de tomates séchées","1 pot de sauce tomate - sans additif ni conservateur !", "2 steaks hachés (100g) pour vos bolo ou burgers", "2 tartares de boeufs (100g) pour les amateurs de viande crue. N'oubliez pas les oeufs!", "2 pavés de saumon (100g), issus de la pêche équitable", "1 paquet de fines tranches (4/6 en fonction de la découpe -100g au total)", "5 tranches (env. 100g) de jambon blanc de Paris", "5 tranches (env. 100g) de jambon de Bayonne","1 saucisson entier (env. 250g), certifié 100% porc français", "1 chorizo entier (env. 250g), made in Francia!", "1 pot de pâté de campagne, certifié 100% comme le faisait ma grand-mère",]
  product_i = AdditionalProduct.create(title: title[i - 1], description: description[i - 1], price: rand(2..10), is_available: Faker::Boolean.boolean(true_ratio: 0.7))
  product_i.image_url.attach(io:File.open("app/assets/images/add_products_#{i}.jpeg"), filename: "add_products_#{i}.jpeg")
  i += 1
end