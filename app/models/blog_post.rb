class BlogPost < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, presence: true
    validates :body, presence: true

    def self.ransackable_attributes(auth_object = nil)
        [ "title" ]
    end
end
