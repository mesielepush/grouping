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

class Group < ApplicationRecord
    belongs_to :user
    has_many :votes
end
