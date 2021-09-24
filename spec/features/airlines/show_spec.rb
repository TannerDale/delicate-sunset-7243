require 'rails_helper'

RSpec.describe 'airline show' do
  describe 'airline show page' do
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

    before :each do
      visit airline_path(airline)
    end

    it 'has the airlines passengers' do
      expect(page).to have_content(pass1.name, count: 1)
      expect(page).to have_content(pass3.name)
      expect(page).to have_content(pass5.name)

      expect(page).not_to have_content(pass2.name)
      expect(page).not_to have_content(pass4.name)
    end
  end
end
