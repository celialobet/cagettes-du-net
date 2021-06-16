class AdditionalProduct < ApplicationRecord
  has_many :selections
  has_many :orders, through: :selections
  has_many :carts, through: :selections

  validates :title,
  presence: true, 
  length: { in: 5..140}

validates :description,
  presence: true, 
  length: { in: 10..1000 }

validates :price,
  presence: true,
  numericality: {greater_than: 0.00}
end
