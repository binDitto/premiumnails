class Category < ActiveRecord::Base
  has_many :service_categories
  has_many :services, through: :service_categories


  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
end
