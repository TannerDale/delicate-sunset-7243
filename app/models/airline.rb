class Airline < ApplicationRecord
  has_many :flights
  has_many :tickets, through: :flights
  has_many :passengers, through: :flights

  def adult_passengers
    passengers.adults.distinct
  end
end
