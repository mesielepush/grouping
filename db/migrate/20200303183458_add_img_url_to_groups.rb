class AddImgUrlToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :imagen_url, :string
  end
end
