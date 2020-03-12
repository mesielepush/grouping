# frozen_string_literal: true

# == Schema Information
#
# Table name: votes
#
#  id           :bigint           not null, primary key
#  name         :string
#  description  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  gravatar_url :string
#  counter      :integer
#  group_id     :bigint
#  user_id      :bigint
#

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :name, presence: true
end
