class CreateBlogImages < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_images do |t|
      t.text :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
