require 'rails_helper'

RSpec.describe 'garden show' do
  describe 'garden show page' do
    let(:garden) { Garden.create!(name: 'Greenery', organic: true) }
    let(:garden2) { Garden.create!(name: 'Greenery', organic: true) }
    let!(:plot1) { Plot.create!(number: 1, size: 'pretty big', direction: 'Weast', garden_id: garden.id) }
    let!(:plot2) { Plot.create!(number: 2, size: 'big', direction: 'North', garden_id: garden.id) }
    let!(:plot3) { Plot.create!(number: 3, size: 'itty-bitty', direction: 'South-ish', garden_id: garden.id) }
    let!(:plot4) { Plot.create!(number: 3, size: 'itty-bitty', direction: 'South-ish', garden_id: garden2.id) }
    let!(:plant1) { Plant.create!(name: 'Plant', description: 'Green', days_to_harvest: 1) }
    let!(:plant2) { Plant.create!(name: 'Hello', description: 'Green', days_to_harvest: 900) }
    let!(:plant3) { Plant.create!(name: 'World', description: 'Green', days_to_harvest: 2) }
    let!(:plant4) { Plant.create!(name: 'Tree', description: 'Green', days_to_harvest: 99) }
    let!(:plant5) { Plant.create!(name: 'Small Tree', description: 'Green', days_to_harvest: 100) }
    let!(:plant6) { Plant.create!(name: 'Small Tree', description: 'Green', days_to_harvest: 99) }
    let!(:location1) { Location.create!(plant_id: plant1.id, plot_id: plot1.id) }
    let!(:location2) { Location.create!(plant_id: plant2.id, plot_id: plot1.id) }
    let!(:location3) { Location.create!(plant_id: plant3.id, plot_id: plot2.id) }
    let!(:location4) { Location.create!(plant_id: plant3.id, plot_id: plot3.id) }
    let!(:location5) { Location.create!(plant_id: plant4.id, plot_id: plot2.id) }
    let!(:location6) { Location.create!(plant_id: plant5.id, plot_id: plot2.id) }
    let!(:location7) { Location.create!(plant_id: plant4.id, plot_id: plot2.id) }
    let!(:location8) { Location.create!(plant_id: plant4.id, plot_id: plot2.id) }
    let!(:location9) { Location.create!(plant_id: plant6.id, plot_id: plot4.id) }
    before :each do
      visit garden_path(garden)
    end

    it 'has the gardens plants' do
      expect(plant4.name).to appear_before(plant3.name, only_text: true)
      expect(plant3.name).to appear_before(plant1.name, only_text: true)

      expect(page).not_to have_content(plant2.name)
      expect(page).not_to have_content(plant5.name)
      expect(page).not_to have_content(plant6.name)
    end
  end
end
