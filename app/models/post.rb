class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
  validates :user_id, presence: true
end
