class Location < ApplicationRecord
  belongs_to :plant
  belongs_to :plot

  scope :related, lambda { |plot|
    where(plot_id: plot.id).first
  }
end
