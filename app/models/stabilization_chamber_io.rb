class StabilizationChamberIo < ActiveRecord::Base
  attr_accessible :temperature

  has_many :packing_pallets
end
