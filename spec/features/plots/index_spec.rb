require 'rails_helper'

RSpec.describe 'plot index' do
  describe 'all plots' do
    let(:garden) { Garden.create!(name: 'Greenery', organic: true) }
    let!(:plot1) { Plot.create!(number: 1, size: 'pretty big', direction: 'Weast', garden_id: garden.id) }
    let!(:plot2) { Plot.create!(number: 2, size: 'big', direction: 'North', garden_id: garden.id) }
    let!(:plot3) { Plot.create!(number: 3, size: 'itty-bitty', direction: 'South-ish', garden_id: garden.id) }
    let!(:plant1) { Plant.create!(name: 'Plant', description: 'Green', days_to_harvest: 1) }
    let!(:plant2) { Plant.create!(name: 'Hello', description: 'Green', days_to_harvest: 9) }
    let!(:plant3) { Plant.create!(name: 'World', description: 'Green', days_to_harvest: 2) }
    let!(:plant4) { Plant.create!(name: 'Tree', description: 'Green', days_to_harvest: 5) }
    let!(:plant5) { Plant.create!(name: 'Small Tree', description: 'Green', days_to_harvest: 3) }
    let!(:location1) { Location.create!(plant_id: plant1.id, plot_id: plot1.id) }
    let!(:location2) { Location.create!(plant_id: plant2.id, plot_id: plot1.id) }
    let!(:location3) { Location.create!(plant_id: plant3.id, plot_id: plot2.id) }
    let!(:location4) { Location.create!(plant_id: plant4.id, plot_id: plot3.id) }
    let!(:location5) { Location.create!(plant_id: plant5.id, plot_id: plot3.id) }

    before :each do
      visit plots_path
    end

    describe 'story 1' do
      it 'has all the plots and their plants' do
        [plot1, plot2, plot3].each do |plot|
          expect(page).to have_content(plot.number)
          plot.plants.each do |plant|
            expect(page).to have_content(plant.name)
          end
        end
      end
    end

    describe 'story 2' do
      it 'can remove a plant from a plot' do
        within "#plot-#{plot2.id}" do
          expect(page).to have_content(plant3.name)

          click_on 'Remove'

          expect(page).not_to have_content(plant3.name)
        end
      end
    end
  end
end
