class FrozenTunnelIo < ActiveRecord::Base
  acts_as_heir_of :subprocess_io
  attr_accessible :order_number, :packing_pallet_temperature, :tunnel_id, :tunnel_temperature, :heir_id, :direction, :io_datetime, :packing_pallet_id, :subprocess_id, :worker_id
  validates :direction, :presence => true

  has_many :packing_pallets
end
