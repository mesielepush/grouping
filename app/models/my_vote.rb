# == Schema Information
#
# Table name: my_votes
#
#  id         :bigint           not null, primary key
#  votes_id   :integer
#  counter    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MyVote < ApplicationRecord
end
