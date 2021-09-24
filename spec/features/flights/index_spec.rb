require 'rails_helper'

RSpec.describe 'Airline index' do
  describe 'Airline index page' do
    let!(:airline) { Airline.create(name: 'Hello') }
    let!(:airline2) { Airline.create(name: 'World') }
    let!(:flight1) { create :flight, { airline_id: airline.id } }
    let!(:flight2) { create :flight, { airline_id: airline2.id } }
    let!(:pass1) { create :passenger }
    let!(:pass2) { create :passenger }
    let!(:pass3) { create :passenger }
    let!(:tick1) { Ticket.create(passenger_id: pass1.id, flight_id: flight1.id) }
    let!(:tick2) { Ticket.create(passenger_id: pass2.id, flight_id: flight2.id) }
    let!(:tick3) { Ticket.create(passenger_id: pass3.id, flight_id: flight1.id) }

    before :each do
      visit flights_path
    end

    it 'has the flights and their airline and passengers' do
      within "#flight-#{flight1.id}" do
        expect(page).to have_content(flight1.number)
        expect(page).to have_content(airline.name)
        expect(page).to have_content(pass1.name)
        expect(page).to have_content(pass3.name)
      end

      within "#flight-#{flight2.id}" do
        expect(page).to have_content(flight2.number)
        expect(page).to have_content(airline2.name)
        expect(page).to have_content(pass2.name)
      end
    end

    it 'can remove a passenger' do
      expect(Passenger.count).to eq(3)

      within "#flight-#{flight1.id}" do
        expect(page).to have_content(pass1.name)

        click_on "Remove #{pass1.name}"

        expect(page).not_to have_content(pass1.name)
      end

      expect(current_path).to eq(flights_path)
      expect(flight1.passengers.count).to eq(1)
      expect(Passenger.count).to eq(3)
    end
  end
end
