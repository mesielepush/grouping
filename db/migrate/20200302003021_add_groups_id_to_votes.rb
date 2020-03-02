class AddGroupsIdToVotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes, :group, foreign_key: {to_table: :groups}
    
  end
end
