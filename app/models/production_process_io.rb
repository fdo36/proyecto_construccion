class ProductionProcessIo < ActiveRecord::Base
  attr_accessible :order_number, :production_lines_number

  has_many :packing_pallets
end
