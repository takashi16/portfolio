class AddCounterToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :counter, :integer
  end
end
