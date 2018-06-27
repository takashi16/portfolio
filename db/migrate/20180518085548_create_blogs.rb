class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
    	t.string :title
        t.string :body
        t.references :user, foreign_key: true
 	t.datetime :created_at, default: -> { :date }
 	add_column :articles, :impressions_count, :integer, default: 0

    t.timestamps
    end
    add_index :blogs,[:user_id,:created_at]
  end
end
