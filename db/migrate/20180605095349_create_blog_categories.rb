class CreateBlogCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_categories do |t|
    	t.integer :blog_id
      	t.integer :category_id


      t.timestamps
    end
    add_index :blog_categories, :blog_id
    add_index :blog_categories, :category_id
    add_index :blog_categories, [:blog_id,:category_id],unique: true
  end
end
