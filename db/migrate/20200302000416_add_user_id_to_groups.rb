# frozen_string_literal: true

class AddUserIdToGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :user, foreign_key: { to_table: :users }
  end
end
