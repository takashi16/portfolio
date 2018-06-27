class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :blog_images
  has_many :blogs
  has_many :blog_comments, dependent: :destroy
  attachment :image
  validates :name, presence: true, uniqueness: true,
  				   length:{ in: 2..20 }
  acts_as_taggable
  is_impressionable

end
