class Flight < ApplicationRecord
  belongs_to :airline
  has_many :tickets, dependent: :destroy
  has_many :passengers, through: :tickets
end
