# frozen_string_literal: true

class AddUserIdToMyVotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :my_votes, :user, foreign_key: { to_table: :users }
  end
end
