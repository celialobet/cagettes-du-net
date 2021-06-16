class Delivery < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :location
end
