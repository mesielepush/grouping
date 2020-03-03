# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user1 = User.new(name: 'uno', email: 'uno@gmail.com', gravatar: 'https://bit.ly/3cvbjKU', password: 'pppppp', password_confirmation: 'pppppp')
user2 = User.new(name: 'dos', email: 'dos@gmail.com', gravatar: 'https://go.aws/2uR55UX',password: 'pppppp', password_confirmation: 'pppppp')
user3 = User.new(name: 'tres', email: 'tres@gmail.com', gravatar: 'https://bit.ly/3csJgMs',password: 'pppppp', password_confirmation: 'pppppp')
user4 = User.new(name: 'cuatro', email: 'cuatro@gmail.com', gravatar: 'https://bit.ly/32LOrCB',password: 'pppppp', password_confirmation: 'pppppp')
user5 = User.new(name: 'cinco', email: 'cinco@gmail.com', gravatar: 'https://bit.ly/32LOCOh',password: 'pppppp', password_confirmation: 'pppppp')
user6 = User.new(name: 'seis', email: 'seis@gmail.com', gravatar: 'https://bit.ly/32NamJz',password: 'pppppp', password_confirmation: 'pppppp')

user_group_1 = user1.groups.new(name: "Kiwi's Education", description: "Having a Kiwi i'ts cool and all but what about the kikwi's learning environment?.", imagen_url: 'https://bit.ly/3atyNOZ').save
user_group_2 = user2.groups.new(name: 'General Relativity', description: "Is it?, is it thou?", imagen_url: 'https://bit.ly/39iZPII').save
user_group_3 = user3.groups.new(name: 'Jacques Brel is trash', description: 'Jacques Brel should be prohibited, he smells funny, maybe drinks some alcohols or something', imagen_url: 'https://bit.ly/3cmNLrP').save
user_group_4 = user4.groups.new(name: 'Bruno did nothing wrong', description: 'Even thou Mr Giordano i´ts not very popular right now, we should check his non secular works for memes' , imagen_url: 'https://bit.ly/2TyeHMB').save
user_group_5 = user5.groups.new(name: 'Apples', description: 'apples', imagen_url: 'https://bit.ly/32XtrZT').save
user_group_6 = user6.groups.new(name: 'Victory of Samothrace', description: 'Self explanatory mate', imagen_url: 'https://bit.ly/2wtpr7e').save

