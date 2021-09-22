class Garden < ApplicationRecord
  has_many :plots
  has_many :plants, through: :plots

  def ordered_unique_under_100_day_plants
    plants
      .under_100_days
      .select('plants.*, COUNT(plants.id) AS amount')
      .group('plants.id')
      .order(amount: :desc)
  end
end
