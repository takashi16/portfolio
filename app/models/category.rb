class Category < ApplicationRecord
  validates :name,presence:true,length:{maximum:50}
  has_many :blog, through: :blog_categories
  has_many :blog_categories, dependent: :destroy
end
