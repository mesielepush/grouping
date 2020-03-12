# frozen_string_literal: true

class AddCounterToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :counter, :integer
  end
end
