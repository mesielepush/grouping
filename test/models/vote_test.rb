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

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
