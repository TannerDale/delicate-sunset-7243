class Airline < ApplicationRecord
  has_many :flights, dependent: :destroy
  has_many :tickets, through: :flights
  has_many :passengers, through: :flights

  def adult_passengers
    passengers
      .ordered_by_flight_count
      .adults
  end
end
