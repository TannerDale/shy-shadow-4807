require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { should belong_to :plot }
    it { should belong_to :plant }
  end

  describe 'finding its relation' do
    let(:garden) { Garden.create!(name: 'Greenery', organic: true) }
    let!(:plot) { Plot.create!(number: 1, size: 'pretty big', direction: 'Weast', garden_id: garden.id) }
    let!(:plant) { Plant.create!(name: 'Small Tree', description: 'Green', days_to_harvest: 3) }
    let!(:location) { Location.create!(plant_id: plant.id, plot_id: plot.id) }

    it 'can find its plot and plant' do
      expect(plant.locations.related(plot)).to eq(location)
    end
  end
end
