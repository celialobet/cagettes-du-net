class Cart < ApplicationRecord
  belongs_to: user
  has_many :selections
  has_many :baskets, through: :selections
  has_many :additional_product, through: :selections

  def total_cart
    @total_cart = 0

    self.selections.basket.each do |basket|
      @total_cart = basket.price + @total_cart
    end
    self.selections.additional_product.each do |additional_product|
      @total_cart = additional_product.price + @total_cart
    end
    return @total_cart
  end
end
