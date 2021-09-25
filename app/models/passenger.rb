class Passenger < ApplicationRecord
  has_many :tickets, dependent: :destroy
  has_many :flights, through: :tickets
  has_many :airlines, through: :flights

  scope :adults, -> {
    where('passengers.age >= ?', 18)
  }

  scope :ordered_by_flight_count, -> {
    joins(:flights)
      .select('passengers.*, COUNT(flights.id) AS flight_count')
      .order(flight_count: :desc)
      .group(:id)
  }
end
