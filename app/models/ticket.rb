class Ticket < ApplicationRecord
  belongs_to :flight
  has_one :airline, through: :flight
  belongs_to :passenger
end
