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
    @delivery = Delivery.create(user_id: self.user_id, order_id: self.id, location_id: self.user.location_id)
    
    if @delivery.location.day == "lundi" || @delivery.location.day == "Lundi"
      delivery = :monday
    elsif @delivery.location.day == "mardi" || @delivery.location.day == "Mardi"
      delivery = :tuesday
    elsif @delivery.location.day == "mercredi" || @delivery.location.day == "Mercredi"
      delivery = :wednesday
    elsif @delivery.location.day == "jeudi" || @delivery.location.day == "Jeudi"
      delivery = :thursday
    elsif @delivery.location.day == "vendredi" || @delivery.location.day == "Vendredi"
      delivery = :friday
    end

    today = Date.today

    @delivery.time = today.next_occurring(delivery)
    @delivery.time = @delivery.time + (@delivery.location.time * 3600)

    @delivery.save

    OrderMailer.delivery_email(@delivery).deliver_now 
  end

end
