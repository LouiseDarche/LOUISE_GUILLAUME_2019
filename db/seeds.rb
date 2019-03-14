# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
puts "destroying all places"
Place.destroy_all

puts "creating all places"
baraque = Place.create!(name: "La Baraque de Sérignac 💍", address: "30260 Orthoux-Sérignac-Quilhan")
gare_montpellier = Place.create!(name: "Gare de Montpellier Saint-Roch 🚄", address: "Place Auguste Gibert, 34000 Montpellier")
gare_nimes = Place.create!(name: "Gare de Nîmes 🚄", address: "1 Boulevard Sergent Triaire, 30000 Nîmes")
aeroport_montpellier = Place.create!(name: "Aéroport Montpellier Méditerranée ✈️", address: "Aéroport Montpellier Méditerranée")
aeroport_marseille = Place.create!(name: "Aéroport Marseille Provence ✈️", address: "13727 Marignane")

puts "finished"
