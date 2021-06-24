class Order < ApplicationRecord
  belongs_to :user
  has_many :selections
  has_many :deliveries
  has_many :baskets, through: :selections
  has_many :additional_product, through: :selections

  after_create :create_delivery

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

  def create_delivery
    @delivery = Delivery.create(user_id: current_user.id, order_id: self.id, location_id: current_user.location_id)
    
    if location.day == "lundi" || location.day == "Lundi"
      day_delivery = "monday"
    elsif location.day == "mardi" || location.day == "Mardi"
      day_delivery = "tuesday"
    elsif location.day == "mercredi" || location.day == "Mercredi"
      day_delivery = "wednesday"
    elsif location.day == "jeudi" || location.day == "Jeudi"
      day_delivery = "thursday"
    elsif location.day == "vendredi" || location.day == "Vendredi"
      day_delivery = "friday"
    end

    today = Date.today

    @delivery.time = today.next_occurring(:day_delivery)
    @delivery.save
  end

end
