class Selection < ApplicationRecord
  belongs_to :basket, optional: true
  belongs_to :additional_product, optional: true
  belongs_to :cart
  belongs_to :order, optional: true 
end
