require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { should belong_to :plot }
    it { should belong_to :plant }
  end
end
