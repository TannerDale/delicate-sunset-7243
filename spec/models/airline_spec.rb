require 'rails_helper'

RSpec.describe Airline do
  describe 'relationships' do
    it { should have_many(:flights) }
    it { should have_many(:passengers).through :flights }
  end

  describe 'instance methods' do
    let!(:airline) { Airline.create(name: 'Hello') }
    let!(:airline2) { Airline.create(name: 'World') }
    let!(:flight1) { create :flight, { airline_id: airline.id } }
    let!(:flight2) { create :flight, { airline_id: airline.id } }
    let!(:flight3) { create :flight, { airline_id: airline2.id } }
    let!(:pass1) { create :passenger, { age: 18 } }
    let!(:pass2) { create :passenger, { age: 20 } }
    let!(:pass4) { create :passenger, { age: 17 } }
    let!(:pass5) { create :passenger, { age: 22 } }
    let!(:pass3) { create :passenger, { age: 79 } }
    let!(:tick1) { Ticket.create(passenger_id: pass1.id, flight_id: flight1.id) }
    let!(:tick2) { Ticket.create(passenger_id: pass2.id, flight_id: flight3.id) }
    let!(:tick3) { Ticket.create(passenger_id: pass3.id, flight_id: flight1.id) }
    let!(:tick4) { Ticket.create(passenger_id: pass4.id, flight_id: flight1.id) }
    let!(:tick5) { Ticket.create(passenger_id: pass5.id, flight_id: flight2.id) }
    let!(:tick6) { Ticket.create(passenger_id: pass1.id, flight_id: flight2.id) }

    it 'has the adults' do
      expect(airline.adult_passengers).to eq([pass1, pass5, pass3])
    end
  end
end
