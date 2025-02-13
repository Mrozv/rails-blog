class User < ApplicationRecord
  has_many :blog_posts
  has_many :comments
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{name} #{last_name}"
  end
end
