class Cart < ApplicationRecord
  belongs_to :user
 
  has_many :selections
  has_many :baskets, through: :selections
  has_many :additional_product, through: :selections

  def total_cart
    @total_cart = 0
    
    self.selections.each do |selection|
      if selection.basket_id == nil 
        @total_cart = @total_cart + selection.additional_product.price
      elsif selection.additional_product_id == nil 
        @total_cart = @total_cart + selection.basket.price
      end
    end
    return @total_cart
  end
end
