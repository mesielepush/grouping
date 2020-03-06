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
    
    def group_total
        total = 0
        demands = self.votes
        demands.each do |demand|
            total += demand.counter
        end
        total
    end

    def my_collaborators(current_user)
        collaborators = {}
        demands = self.votes.where.not(user_id: current_user)

        demands.each do |demand|
            if collaborators[demand.user_id] == nil

                collaborators[demand.user_id] = {}
                collaborators[demand.user_id][:counter] = 0
            end
            
            collaborators[demand.user_id][:name] = User.find_by_id(demand.user_id).name
            collaborators[demand.user_id][:counter] += demand.counter
            
            
        end
        
        collaborators
    end

    def all_collaborators
        colaborators = []
        demands = self.votes
        demands.each do |demand|
            collaborators[demand.user_id] ||= {}
            collaborators[demand.user_id][:counter] = 0
            collaborators[demand.user_id][:creator] = demand.user_id
            collaborators[demand.user_id][:counter] += demand.counter
        end
        collaborators
    end


end
#<% @group.votes.where(user_id: col_id).each do |demand|%>
#    <%= demand.name[0..45] %>
#<%end%>