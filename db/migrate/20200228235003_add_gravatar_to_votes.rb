class AddGravatarToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :gravatar_url, :string
  end
end
