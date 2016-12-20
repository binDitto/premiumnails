class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :description, presence: true, length: { minimum: 2, maximum: 500 }
end
