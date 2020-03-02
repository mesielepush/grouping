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

require 'test_helper'

class MyVoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
