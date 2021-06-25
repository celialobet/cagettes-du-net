class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :user_cart
  after_create :welcome_send
  after_create :create_stripe_customer

  has_many :subscriptions
  has_many :deliveries
  has_many :orders
  belongs_to :location, optional: true
  has_one :cart
  has_one_attached :avatar


  def user_cart
    Cart.create(user_id: self.id)
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def create_stripe_customer
    customer = Stripe::Customer.create({
      email: self.email,
    })
    self.stripe_customer_id = customer.id
    self.save
  end
end
