class AddDescriptionToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :description, :string
      
  end
end
