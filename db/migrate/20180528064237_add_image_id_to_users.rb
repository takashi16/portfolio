class AddImageIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image_id, :text
    add_column :users, :name, :string
  end
end
