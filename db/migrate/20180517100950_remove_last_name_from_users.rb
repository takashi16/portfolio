class RemoveLastNameFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :last_name, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_kana, :string
    remove_column :users, :first_kana, :string
    remove_column :users, :postal_code, :string
    remove_column :users, :address, :string
    remove_column :users, :tell, :string
  end
end
