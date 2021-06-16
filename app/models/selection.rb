class Selection < ApplicationRecord
  belongs_to :basket
  belongs_to :additional_product, optional: true
  belongs_to :cart
  belongs_to :order, optional: true 
end
