class TransitChamberIo < ActiveRecord::Base
  acts_as_heir_of :subprocess_io
  attr_accessible :order_number, :temperature
end
