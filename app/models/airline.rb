class Airline < ApplicationRecord
  has_many :flights
  has_many :tickets, through: :flights
  has_many :passengers, through: :flights

  def adult_passengers
    passengers
      .adults
      .merge(Passenger.ordered_by_flight_count)
      .distinct
  end
end
