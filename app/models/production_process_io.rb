class ProductionProcessIo < ActiveRecord::Base
  acts_as_heir_of :subprocess_io
  attr_accessible :order_number, :production_lines_number

  has_many :packing_pallets
end
