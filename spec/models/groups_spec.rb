require 'rails_helper'
require 'faker'

RSpec.describe Group, type: :model do
  context 'Group creations validation tests' do
    user = User.new(name: Faker::Name.name, email: Faker::Internet.email, password: 'pppppp', password_confirmation: 'pppppp')
    user.save

    group = Group.new(name: 'some', user_id: user.id, description: 'this is some desciription', imagen_url: 'https://bit.ly/2U5FQ9M')
    it 'has a valid factory' do
      expect(group).to be_valid
    end

    it 'ensures name presence' do
      group.name = nil
      expect(group.save).to eq(false)
      group.name = 'some'
    end

    it 'should save succesfully' do
      expect(group.save).to eq(true)
    end
  end
end
