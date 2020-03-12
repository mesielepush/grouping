require 'rails_helper'
require 'faker'

RSpec.describe Vote, type: :model do
  context 'Demands creations validation tests' do
    user = User.new(name: Faker::Name.name, email: Faker::Internet.email, password: 'pppppp', password_confirmation: 'pppppp')
    user.save

    group = Group.new(name: 'some', user_id: user.id, description: 'this is some desciription', imagen_url: 'https://bit.ly/2U5FQ9M')
    group.save
    vote = group.votes.create(name: 'something', description: 'This is the description for rspec', counter: 0, user_id: user.id, gravatar_url: 'https://bit.ly/2U5FQ9M')
    it 'has a valid factory' do
      expect(vote).to be_valid
    end

    it 'ensures name presence' do
      vote.name = nil
      expect(vote.save).to eq(false)
      vote.name = 'something'
    end

    it 'should save succesfully' do
      expect(vote.save).to eq(true)
    end
  end
end
