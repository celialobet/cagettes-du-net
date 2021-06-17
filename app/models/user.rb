class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :user_cart

  has_many :subscriptions
  has_many :deliveries
  has_many :orders
  belongs_to :location, optional: true
  has_one :cart


  def user_cart
    Cart.create(user_id: self.id)
    puts "Voici le panier numéro #{Cart.last.id}"
  end
end
