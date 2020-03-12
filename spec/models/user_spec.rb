require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  context 'user creations validation tests' do
    user = User.new(name: Faker::Name.name, email: Faker::Internet.email, password: 'pppppp', password_confirmation: 'pppppp')
    it 'has a valid factory' do
      expect(user).to be_valid
    end

    it 'ensures name presence' do
      user.name = nil
      expect(user.save).to eq(false)
      user.name = Faker::Name.name
    end

    it 'should save succesfully' do
      expect(user.save).to eq(true)
    end
  end

end
