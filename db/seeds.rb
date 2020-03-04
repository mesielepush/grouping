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

user1.save
user2.save
user3.save
user4.save
user5.save
user6.save

user_group_1 = user1.groups.new(name: "Kiwi's Education", description: "Having a Kiwi i'ts cool and all but what about the kikwi's learning environment?.", imagen_url: 'https://bit.ly/3cBnxlB')
user_group_2 = user2.groups.new(name: 'General Relativity', description: "Is it?, is it thou?", imagen_url: 'https://bit.ly/39iZPII')
user_group_3 = user3.groups.new(name: 'Jacques Brel is trash', description: 'Jacques Brel should be prohibited, he smells funny, maybe drinks some alcohols or something', imagen_url: 'https://bit.ly/2TvKEFi')
user_group_4 = user4.groups.new(name: 'Bruno did nothing wrong', description: 'Even thou Mr Giordano i´ts not very popular right now, we should check his non secular works for memes' , imagen_url: 'https://bit.ly/2TyeHMB')
user_group_5 = user5.groups.new(name: 'Apples', description: 'apples', imagen_url: 'https://bit.ly/32XtrZT')
user_group_6 = user6.groups.new(name: 'Victory of Samothrace', description: 'Self explanatory mate', imagen_url: 'https://bit.ly/2wtpr7e')

user_group_1.save
user_group_2.save
user_group_3.save
user_group_4.save
user_group_5.save
user_group_6.save

groups = [user_group_1,user_group_2,user_group_3,user_group_4,user_group_5,user_group_6,]

def makeDemand(demand_type)
    case demand_type
        when 1
            demand_title = Faker::Educator.subject + " courses for young kiwi's it's too "+ Faker::Hipster.word+ ", isn't?"
            demand_description = 'Acording to  '+Faker::Science.scientist+' '+ Faker::Educator.degree+' Kiwis should know a little bit of ' +Faker::Educator.subject+', he got his degree from: '+Faker::Educator.campus+' so...'
            demand_avatar = "https://loremflickr.com/#{rand(320..360)}/#{rand(320..360)}/kiwi"

        when 2
            demand_title = Faker::Science.scientist+ " has said that you should take: "+ Faker::Educator.subject+" classes"
            demand_description = "'"+Faker::Marketing.buzzwords+"'"  + ", some "+ Faker::Educator.degree+' would know a little bit of ' +Faker::Educator.subject+', got his degree from: '+Faker::Educator.campus+' so...'
            demand_avatar = "https://loremflickr.com/#{rand(320..360)}/#{rand(320..360)}/science"
        
        when 3
            demand_title = "Jaques Brel has been " + Faker::Verb.past_participle + " and thinks that's too "+ Faker::Hacker.adjective 
            demand_description = "Nothing is more " + Faker::Hacker.adjective + " said Brel on "+ Faker::Company.name + " " + Faker::Company.buzzword + " and then something or i don't know"
            demand_avatar = "https://loremflickr.com/#{rand(320..360)}/#{rand(320..360)}/jaquesbrel"
        
        when 4
            demand_title = "Giordano has been " + Faker::Verb.past_participle + " and thinks that's too "+ Faker::Hacker.adjective 
            demand_description = "Memes are so " + Faker::Hacker.adjective + " said Girdano on "+ Faker::Company.name + " " + Faker::Company.buzzword + " and then something or i don't know"
            demand_avatar = "https://loremflickr.com/#{rand(320..360)}/#{rand(320..360)}/memes"
        
        when 5
            demand_title =  "Apple " + Faker::Dessert.variety + " it's the most "+ Faker::Hacker.adjective
            demand_description = "To end up on a " + Faker::Dessert.variety + " " + Faker::Dessert.flavor + " it's the goal of every Apple" + 
            demand_avatar = "https://loremflickr.com/#{rand(320..360)}/#{rand(320..360)}/apples"

        when 6
            demand_title =  "Today " + Faker::Artist.name + " said victory of Samothrace is "+ Faker::Hacker.adjective
            demand_description = "Again the " + Faker::Hacker.verb  + " of the " + Faker::Hacker.noun + " it's the goal of every Art" + 
            demand_avatar = "https://loremflickr.com/#{rand(320..360)}/#{rand(320..360)}/victoryofsamothrace"
    end

        demand = {
            name: demand_title,
            description: demand_description,
            gravatar_url: demand_avatar
        }
      
end


groups.each do |group|
    (1..10).each do
        
        demand = makeDemand(group.id)
        
        group.votes.new( name:demand[:name],
            description:demand[:description],
            gravatar_url: demand[:gravatar_url],
            user_id:rand(1..6), counter: 0 ).save
        
    end
end
    