require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe 'validations' do
    it { should have_many :locations }
    it { should have_many(:plots).through :locations }
    it { should have_many(:gardens).through :plots }
  end
end
