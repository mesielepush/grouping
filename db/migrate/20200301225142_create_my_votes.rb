# frozen_string_literal: true

class CreateMyVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :my_votes do |t|
      t.integer :votes_id
      t.integer :counter

      t.timestamps
    end
  end
end
