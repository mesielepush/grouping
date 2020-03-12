# frozen_string_literal: true

class AddUsersIdToVotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes, :user, foreign_key: { to_table: :users }
  end
end
