class Order < ApplicationRecord
  belongs_to: user
  has_many: selections
  has_many: deliveries
  has_many: baskets, through: :selections
  has_many: additional_product, through: :selections
end
