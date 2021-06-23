class Order < ApplicationRecord
  belongs_to :user
  has_many :selections
  has_many :deliveries
  has_many :baskets, through: :selections
  has_many :additional_product, through: :selections

  def total_order
    @total_order = 0
    
    self.selections.each do |selection|
      if selection.basket_id == nil 
        @total_order = @total_order + selection.additional_product.price
      elsif selection.additional_product_id == nil 
        @total_order = @total_order + selection.basket.price
      end
    end
    return @total_order
  end

end
