# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airline.destroy_all
Passenger.destroy_all
Flight.destroy_all
Ticket.destroy_all

a1 = Airline.create!(name: 'Hello World')

f1 = Flight.create!(
  number: 11,
  date: 'today',
  arrival_city: 'Austin',
  departure_city: 'Houston',
  airline_id: a1.id
)

f2 = Flight.create!(
  number: 12,
  date: 'today',
  arrival_city: 'Kentucky',
  departure_city: 'Little Rock',
  airline_id: a1.id
)

f3 = Flight.create!(
  number: 13,
  date: 'tomorrow',
  arrival_city: 'New York',
  departure_city: 'Old York',
  airline_id: a1.id
)

bill = Passenger.create!(name: 'Bill', age: 20)
ted = Passenger.create!(name: 'Ted', age: 103)
lacy = Passenger.create!(name: 'Lacy', age: 67)
philip = Passenger.create!(name: 'Philip', age: 12)
megan = Passenger.create!(name: 'Megan', age: 17)
chuck = Passenger.create!(name: 'Chuck', age: 30)

Ticket.create!(passenger_id: bill.id, flight_id: f1.id)
Ticket.create!(passenger_id: ted.id, flight_id: f1.id)
Ticket.create!(passenger_id: lacy.id, flight_id: f1.id)
Ticket.create!(passenger_id: philip.id, flight_id: f1.id)
Ticket.create!(passenger_id: megan.id, flight_id: f1.id)
Ticket.create!(passenger_id: chuck.id, flight_id: f1.id)

Ticket.create!(passenger_id: philip.id, flight_id: f2.id)
Ticket.create!(passenger_id: megan.id, flight_id: f2.id)
Ticket.create!(passenger_id: chuck.id, flight_id: f2.id)

Ticket.create!(passenger_id: philip.id, flight_id: f3.id)
Ticket.create!(passenger_id: megan.id, flight_id: f3.id)
Ticket.create!(passenger_id: chuck.id, flight_id: f3.id)

Ticket.create!(passenger_id: bill.id, flight_id: f2.id)
Ticket.create!(passenger_id: ted.id, flight_id: f2.id)
Ticket.create!(passenger_id: lacy.id, flight_id: f2.id)

Ticket.create!(passenger_id: bill.id, flight_id: f3.id)
Ticket.create!(passenger_id: ted.id, flight_id: f3.id)
Ticket.create!(passenger_id: lacy.id, flight_id: f3.id)
