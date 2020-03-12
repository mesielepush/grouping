# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user1 = User.new(name: 'one', email: 'one@gmail.com', gravatar: 'https://bit.ly/3cvbjKU', password: 'pppppp', password_confirmation: 'pppppp')
user2 = User.new(name: 'two', email: 'two@gmail.com', gravatar: 'https://go.aws/2uR55UX', password: 'pppppp', password_confirmation: 'pppppp')
user3 = User.new(name: 'three', email: 'three@gmail.com', gravatar: 'https://bit.ly/3csJgMs', password: 'pppppp', password_confirmation: 'pppppp')
user4 = User.new(name: 'four', email: 'four@gmail.com', gravatar: 'https://bit.ly/32LOrCB', password: 'pppppp', password_confirmation: 'pppppp')
user5 = User.new(name: 'five', email: 'five@gmail.com', gravatar: 'https://bit.ly/32LOCOh', password: 'pppppp', password_confirmation: 'pppppp')
user6 = User.new(name: 'six', email: 'six@gmail.com', gravatar: 'https://bit.ly/32NamJz', password: 'pppppp', password_confirmation: 'pppppp')

user1.save
user2.save
user3.save
user4.save
user5.save
user6.save

user_group_1 = user1.groups.new(name: "Kiwi's Education", description: "Having a Kiwi i'ts cool and all but what about the kikwi's learning environment?.", imagen_url: 'https://bit.ly/3cBnxlB')
user_group_2 = user2.groups.new(name: 'General Relativity', description: 'Is it?, is it thou?', imagen_url: 'https://bit.ly/39iZPII')
user_group_3 = user3.groups.new(name: 'Jacques Brel', description: 'Jacques Brel should be prohibited, he smells funny, maybe drinks some alcohols or something', imagen_url: 'https://bit.ly/2vHKgeO')
user_group_4 = user4.groups.new(name: 'Bruno did nothing wrong', description: 'Even thou Mr Giordano i´ts not very popular right now, we should check his non secular works for memes', imagen_url: 'https://bit.ly/2TyeHMB')
user_group_5 = user5.groups.new(name: 'Apples', description: 'apples', imagen_url: 'https://bit.ly/32XtrZT')
user_group_6 = user6.groups.new(name: 'Victory of Samothrace', description: 'Self explanatory mate', imagen_url: 'https://bit.ly/3aredyt')

extra_group_1 = user1.groups.new(name: 'Politics', description: 'General Politics', imagen_url: 'https://bit.ly/39JUr1d')
extra_group_2 = user2.groups.new(name: 'Boxing Fights', description: "Let's rate live fights?", imagen_url: 'https://bit.ly/2W2XLk5')

extra_group_1.save
extra_group_2.save

extra_group_1.votes.new(name: 'President Juarez is the antichrist',
                        description: 'Church and State separation is the first step to corruption',
                        gravatar_url: 'https://bit.ly/2WfDesX',
                        user_id: 2, counter: 0).save

extra_group_2.votes.new(name: 'Ali in Ali vs Foreman',
                        description: "He's not finished",
                        gravatar_url: 'https://bit.ly/3cRN3mH',
                        user_id: 1, counter: 0).save

extra_group_2.votes.new(name: 'Foreman in Ali vs Foreman',
                        description: 'This is gonna be an easy one for Foreman I tell you',
                        gravatar_url: 'https://bit.ly/3aILXre',
                        user_id: 3, counter: 0).save

extra_group_2.votes.new(name: 'Morales in Morales vs Barrera',
                        description: "Great oportunity for Morales let's rate it live",
                        gravatar_url: 'https://bit.ly/3cTdlok',
                        user_id: 4, counter: 0).save
extra_group_2.votes.new(name: 'Pryor in Pryor vs Arguello',
                        description: "Pryor can't losse",
                        gravatar_url: 'https://bit.ly/2vY7PAl',
                        user_id: 5, counter: 0).save

user_group_1.save
user_group_2.save
user_group_3.save
user_group_4.save
user_group_5.save
user_group_6.save

groups = [user_group_1, user_group_2, user_group_3, user_group_4, user_group_5, user_group_6]

def makeDemand(demand_type)
  case demand_type
  when 1
    demand_title = Faker::Educator.subject + " courses for young kiwi's it's too " + Faker::Hipster.word + ", isn't?"
    demand_description = 'Acording to  ' + Faker::Science.scientist + ' ' + Faker::Educator.degree + ' Kiwis should know a little bit of ' + Faker::Educator.subject + ', he got his degree from: ' + Faker::Educator.campus + ' so...'
    demand_avatar = "https://loremflickr.com/#{rand(320..360)}/#{rand(320..360)}/kiwi"

  when 2
    demand_title = Faker::Science.scientist + ' has said that you should take: ' + Faker::Educator.subject + ' classes'
    demand_description = "'" + Faker::Marketing.buzzwords + "'" + ', some ' + Faker::Educator.degree + ' would know a little bit of ' + Faker::Educator.subject + ', got his degree from: ' + Faker::Educator.campus + ' so...'
    demand_avatar = "https://loremflickr.com/#{rand(320..360)}/#{rand(320..360)}/science"

  when 3
    demand_title = 'Jaques Brel has been ' + Faker::Verb.past_participle + " and thinks that's too " + Faker::Hacker.adjective
    demand_description = 'Nothing is more ' + Faker::Hacker.adjective + ' said Brel on ' + Faker::Company.name + ' ' + Faker::Company.buzzword + " and then something or i don't know"
    demand_avatar = "https://loremflickr.com/#{rand(320..360)}/#{rand(320..360)}/jaquesbrel"

  when 4
    demand_title = 'Giordano has been ' + Faker::Verb.past_participle + " and thinks that's too " + Faker::Hacker.adjective
    demand_description = 'Memes are so ' + Faker::Hacker.adjective + ' said Girdano on ' + Faker::Company.name + ' ' + Faker::Company.buzzword + " and then something or i don't know"
    demand_avatar = "https://loremflickr.com/#{rand(320..360)}/#{rand(320..360)}/memes"

  when 5
    demand_title =  'Apple ' + Faker::Dessert.variety + " it's the most " + Faker::Hacker.adjective
    demand_description = 'To end up on a ' + Faker::Dessert.variety + ' ' + Faker::Dessert.flavor + " it's the goal of every Apple"
    demand_avatar = "https://loremflickr.com/#{rand(320..360)}/#{rand(320..360)}/apples"

  when 6
    demand_title =  'Today ' + Faker::Artist.name + ' said victory of Samothrace is ' + Faker::Hacker.adjective
    demand_description = 'Again the ' + Faker::Hacker.verb + ' of the ' + Faker::Hacker.noun + " it's the goal of every Art"
    demand_avatar = "https://loremflickr.com/#{rand(320..360)}/#{rand(320..360)}/victoryofsamothrace"
  end

  demand = {
    name: demand_title,
    description: demand_description,
    gravatar_url: demand_avatar
  }
end

groups.each do |group|
  50.times do
    demand = makeDemand(group.id)

    group.votes.new(name: demand[:name],
                    description: demand[:description],
                    gravatar_url: demand[:gravatar_url],
                    user_id: rand(1..6), counter: 0).save
  end
end

def up_myvote(vote_id, user, n)
  n.times do
    user = User.find_by_id(user)
    votes = Vote.find_by_id(vote_id)

    votes.counter += 1
    votes.save

    if user.my_votes.where(votes_id: votes.id).last.nil?
      user.my_votes.new(votes_id: votes.id, counter: 1).save
    else
      count = user.my_votes.where(votes_id: votes.id).last.counter
      user.my_votes.new(votes_id: votes.id, counter: count + 1).save
    end
  end
end

def down_myvote(vote_id, user, n)
  n.times do
    user = User.find_by_id(user)
    votes = Vote.find_by_id(vote_id)

    votes.counter -= 1
    votes.save

    if user.my_votes.where(votes_id: votes.id).last.nil?
      user.my_votes.new(votes_id: votes.id, counter: 1).save
    else
      count = user.my_votes.where(votes_id: votes.id).last.counter
      user.my_votes.new(votes_id: votes.id, counter: count - 1).save
    end
  end
end

def vote_for_ali
  down_myvote(2, 2, 30)
  up_myvote(2, 2, 5)
  down_myvote(2, 2, 10)
  up_myvote(2, 2, 15)
  down_myvote(2, 2, 5)
  up_myvote(2, 2, 45)

  down_myvote(2, 1, 10)
  up_myvote(2, 1, 3)
  down_myvote(2, 1, 15)
  up_myvote(2, 1, 5)
  down_myvote(2, 1, 5)
  up_myvote(2, 1, 60)

  down_myvote(2, 3, 40)
  up_myvote(2, 3, 5)
  down_myvote(2, 3, 10)
  up_myvote(2, 3, 25)
  down_myvote(2, 3, 15)
  up_myvote(2, 3, 70)
end

def vote_for_foreman
  up_myvote(3, 2, 20)
  down_myvote(3, 2, 5)
  up_myvote(3, 2, 15)
  down_myvote(3, 2, 5)
  up_myvote(3, 2, 5)
  down_myvote(3, 2, 25)
  up_myvote(3, 2, 5)
  down_myvote(3, 2, 55)

  up_myvote(3, 3, 20)
  down_myvote(3, 3, 5)
  up_myvote(3, 3, 15)
  down_myvote(3, 3, 5)
  up_myvote(3, 3, 5)
  down_myvote(3, 3, 25)
  up_myvote(3, 3, 5)
  down_myvote(3, 3, 55)

  up_myvote(3, 4, 10)
  down_myvote(3, 4, 3)
  up_myvote(3, 4, 25)
  down_myvote(3, 4, 5)
  up_myvote(3, 4, 8)
  down_myvote(3, 4, 38)
  up_myvote(3, 4, 5)
  down_myvote(3, 4, 65)
end

def vote_for_barrera
  up_myvote(4, 4, 8)
  down_myvote(4, 4, 5)
  up_myvote(4, 4, 10)
  down_myvote(4, 4, 8)
  up_myvote(4, 4, 8)
  down_myvote(4, 4, 16)
  up_myvote(4, 4, 6)
  down_myvote(4, 4, 2)
  up_myvote(4, 4, 4)

  up_myvote(4, 1, 8)
  down_myvote(4, 1, 5)
  up_myvote(4, 1, 10)
  down_myvote(4, 1, 8)
  up_myvote(4, 1, 8)
  down_myvote(4, 1, 16)
  up_myvote(4, 1, 6)
  down_myvote(4, 1, 2)
  up_myvote(4, 1, 4)

  up_myvote(4, 2, 10)
  down_myvote(4, 2, 3)
  up_myvote(4, 2, 3)
  down_myvote(4, 2, 5)
  up_myvote(4, 2, 6)
  down_myvote(4, 2, 7)
  up_myvote(4, 2, 6)
  down_myvote(4, 2, 2)
  up_myvote(4, 2, 1)
end

def vote_for_pryor
  up_myvote(5, 2, 15)
  down_myvote(5, 2, 5)
  up_myvote(5, 2, 6)
  down_myvote(5, 2, 6)
  up_myvote(5, 2, 6)
  down_myvote(5, 2, 8)
  up_myvote(5, 2, 10)
  down_myvote(5, 2, 2)
  up_myvote(5, 2, 12)

  up_myvote(5, 1, 25)
  down_myvote(5, 1, 5)
  up_myvote(5, 1, 6)
  down_myvote(5, 1, 6)
  up_myvote(5, 1, 3)
  down_myvote(5, 1, 10)
  up_myvote(5, 1, 2)
  down_myvote(5, 1, 9)
  up_myvote(5, 1, 5)

  up_myvote(5, 3, 3)
  down_myvote(5, 3, 3)
  up_myvote(5, 3, 2)
  down_myvote(5, 3, 4)
  up_myvote(5, 3, 3)
  down_myvote(5, 3, 1)
  up_myvote(5, 3, 5)
  down_myvote(5, 3, 1)
  up_myvote(5, 3, 10)
end
vote_for_ali
vote_for_foreman
vote_for_barrera
vote_for_pryor
