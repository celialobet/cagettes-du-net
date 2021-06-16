class User < ApplicationRecord
  has_many: subscriptions
  has_many: deliveries
  has_many: orders
  belongs_to: location
  has_one: cart
end
