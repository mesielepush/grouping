class AddGravatarToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :gravatar, :string
  end
end
