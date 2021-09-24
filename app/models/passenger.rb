class Passenger < ApplicationRecord
  has_many :tickets
  has_many :flights, through: :tickets
  has_many :airlines, through: :flights

  scope :adults, -> {
    where('passengers.age >= ?', 18)
  }
end
