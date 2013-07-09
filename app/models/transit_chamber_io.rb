class TransitChamberIo < ActiveRecord::Base
  acts_as_heir_of :subprocess_io
  attr_accessible :order_number, :temperature, :direction, :io_datetime, :packing_pallet_id, :subprocess_id, :worker_id, :heir_id, :heir_type

  validates :direction, :inclusion => {:in => [true, false]}
  validates :temperature, :worker_id, :presence => true
  validates :temperature, :numericality => true
  has_many :packing_pallets
end
