class Plant < ApplicationRecord
  has_many :locations
  has_many :plots, through: :locations
  has_many :gardens, through: :plots
end
