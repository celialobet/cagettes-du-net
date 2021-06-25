class Location < ApplicationRecord
  has_many :users
  has_many :deliveries
  has_many :subscriptions

  validates :name,
  presence: true, 
  length: { in: 5..140}

  validates :description,
    presence: true, 
    length: { in: 10..1000 }

  validates :address_number,
    presence: true,
    numericality: { greater_than: 0 }

  validates :address_street,
    presence: true,
    length: { in: 5..200 }

  validates :address_city,
    presence: true,
    acceptance: { accept: 'Paris' }

  validates :zip_code,
    presence: true,
    acceptance: { accept: [75001,75002,75003,75004,75005,75006,75007,75008,75009,75010,75011,75012,75013,75014,75015,75016,75017,75018,75019,75020], message: 'Nous ne livrons pas encore en dehors de Paris, désolé !' }

  validates :day,
    presence: true,
    acceptance: { accept: ['lundi','mardi','mercredi','jeudi','vendredi','Lundi','Mardi','Mercredi','Jeudi','Vendredi'] }

  validates :time,
    presence: true

  validates :opening_hours,
    presence: true
  
end
