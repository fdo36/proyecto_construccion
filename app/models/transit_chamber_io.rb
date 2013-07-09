class TransitChamberIo < ActiveRecord::Base
  acts_as_heir_of :subprocess_io
  attr_accessible :order_number, :temperature, :direction, :worker_id, :packing_pallet_id, :io_datetime,:heir_id, :heir_type

  validates :direction, :inclusion => {:in => [true, false]}
  validates :temperature, :worker_id, :presence => true
  validates :temperature, :numericality => true
  has_many :packing_pallets
end
