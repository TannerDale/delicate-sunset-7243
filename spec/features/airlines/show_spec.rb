require 'rails_helper'

RSpec.describe 'airline show' do
  describe 'airline show page' do
    let!(:airline) { Airline.create(name: 'Hello') }
    let!(:airline2) { Airline.create(name: 'World') }
    let!(:flight1) { create :flight, { airline_id: airline.id } }
    let!(:flight2) { create :flight, { airline_id: airline.id } }
    let!(:flight3) { create :flight, { airline_id: airline2.id } }
    let!(:flight4) { create :flight, { airline_id: airline.id } }
    let!(:flight5) { create :flight, { airline_id: airline.id } }
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

    let!(:tick7) { Ticket.create(passenger_id: pass1.id, flight_id: flight2.id) }
    let!(:tick8) { Ticket.create(passenger_id: pass1.id, flight_id: flight4.id) }
    let!(:tick9) { Ticket.create(passenger_id: pass1.id, flight_id: flight5.id) }

    let!(:tick10) { Ticket.create(passenger_id: pass3.id, flight_id: flight2.id) }
    let!(:tick11) { Ticket.create(passenger_id: pass3.id, flight_id: flight4.id) }

    let!(:tick12) { Ticket.create(passenger_id: pass5.id, flight_id: flight4.id) }

    before :each do
      visit airline_path(airline)
    end

    it 'has the airlines passengers ordered by flight count' do
      save_and_open_page
      expect(page).to have_content(pass1.name, count: 1)
      expect(page).to have_content(pass3.name, count: 1)
      expect(page).to have_content(pass5.name, count: 1)

      expect(pass1.name).to appear_before(pass3.name, only_text: true)
      expect(pass3.name).to appear_before(pass5.name, only_text: true)

      expect(page).not_to have_content(pass2.name)
      expect(page).not_to have_content(pass4.name)
    end
  end
end
