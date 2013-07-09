class ProductionProcessIo < ActiveRecord::Base
  acts_as_heir_of :subprocess_io
  attr_accessible :order_number, :production_lines_number,:direction, :io_datetime, :packing_pallet_id, :subprocess_id, :worker_id
  

  validates :order_number, :presence =>true
  validates :production_lines_number, :presence => true
  validates :worker_id, :presence => true

  attr_accessible :order_number, :production_lines_number

  has_many :packing_pallets
end
