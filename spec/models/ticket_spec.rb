require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'relationships' do
    it { should belong_to :flight }
    it { should belong_to :passenger }
    it { should have_one(:airline).through :flight }
  end
end
