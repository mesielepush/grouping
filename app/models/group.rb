# frozen_string_literal: true

# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#  description :string
#  imagen_url  :string
#
require 'set'
class Group < ApplicationRecord
  belongs_to :user
  has_many :votes
  validates :name, presence: true, length: { maximum: 20 }

  def group_total
    total = 0
    demands = votes
    demands.each do |demand|
      total += demand.counter
    end
    total
  end

  def my_collaborators(current_user)
    collaborators = {}
    votes.where.not(user_id: current_user).each do |vote|
      collaborators[vote.user_id] = { total_counter: 0 } if collaborators[vote.user_id].nil?

      collaborators[vote.user_id][vote.id] = { name: vote.name,
                                               description: vote.description,
                                               counter: vote.counter,
                                               avatar: vote.gravatar_url }
      collaborators[vote.user_id][:total_counter] += vote.counter
    end

    collaborators
  end

  def cumulative; end

  def all_collaborators
    @demands = votes
  end
end
