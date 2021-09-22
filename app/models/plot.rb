class Plot < ApplicationRecord
  belongs_to :garden
  has_many :locations
  has_many :plants, through: :locations
end
