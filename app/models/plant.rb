class Plant < ApplicationRecord
  has_many :locations
  has_many :plots, through: :locations
  has_many :gardens, through: :plots

  scope :under_100_days, lambda {
    where('plants.days_to_harvest < ?', 100)
  }
end
