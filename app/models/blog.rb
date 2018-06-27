class Blog < ApplicationRecord
	acts_as_taggable
	acts_as_taggable_on :categories, :interests
  is_impressionable






	belongs_to :user
	attachment :image
	has_many :blog_comments, dependent: :destroy
	 validates_presence_of :title
	 validates_presence_of :body
	has_many :categories, through: :blog_categories
	has_many :blog_categories, dependent: :destroy

 	def save_categories(tags)
    current_tags = self.categories.pluck(:name) unless self.categories.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.categories.delete Category.find_by(name:old_name)
    end
     # Create new taggings:
    new_tags.each do |new_name|
      article_category = Category.find_or_create_by(name:new_name)
      self.categories << article_category
    end
end
end