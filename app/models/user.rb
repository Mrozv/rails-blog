class User < ApplicationRecord
  has_many :blog_posts
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :name, presence: true
  validates :last_name, presence: true
end
