class Service < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :service_categories
  has_many :categories, through: :service_categories

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :price, presence: true #format: { with: /\A\d+(?:\.\d{2})?\z/ },
            #numericality: { greater_than: 0, less_than: 1000000 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end
