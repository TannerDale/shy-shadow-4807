require 'rails_helper'

RSpec.describe 'garden show' do
  describe 'garden show page' do
    let(:garden) { Garden.create!(name: 'Greenery', organic: true) }
    let!(:plot1) { Plot.create!(number: 1, size: 'pretty big', direction: 'Weast', garden_id: garden.id) }
    let!(:plot2) { Plot.create!(number: 2, size: 'big', direction: 'North', garden_id: garden.id) }
    let!(:plot3) { Plot.create!(number: 3, size: 'itty-bitty', direction: 'South-ish', garden_id: garden.id) }
    let!(:plant1) { Plant.create!(name: 'Plant', description: 'Green', days_to_harvest: 1) }
    let!(:plant2) { Plant.create!(name: 'Hello', description: 'Green', days_to_harvest: 900) }
    let!(:plant3) { Plant.create!(name: 'World', description: 'Green', days_to_harvest: 2) }
    let!(:plant4) { Plant.create!(name: 'Tree', description: 'Green', days_to_harvest: 99) }
    let!(:plant5) { Plant.create!(name: 'Small Tree', description: 'Green', days_to_harvest: 100) }
    let!(:location1) { Location.create!(plant_id: plant1.id, plot_id: plot1.id) }
    let!(:location2) { Location.create!(plant_id: plant2.id, plot_id: plot1.id) }
    let!(:location3) { Location.create!(plant_id: plant3.id, plot_id: plot2.id) }
    let!(:location4) { Location.create!(plant_id: plant4.id, plot_id: plot3.id) }
    let!(:location5) { Location.create!(plant_id: plant4.id, plot_id: plot2.id) }
    let!(:location6) { Location.create!(plant_id: plant5.id, plot_id: plot2.id) }

    before :each do
      visit garden_path(garden)
    end

    it 'has the gardens plants' do
      [plant1, plant3, plant4].each do |plant|
        expect(page).to have_content(plant.name)
      end

      expect(page).not_to have_content(plant2.name)
      expect(page).not_to have_content(plant5.name)
    end
  end
end
