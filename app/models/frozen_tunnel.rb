class FrozenTunnel < ActiveRecord::Base
  acts_as_heir_of :subprocess_io
  attr_accessible :order_number, :heir_id, :packing_pallet_temperature, :tunnel_id, :tunnel_temperature, :direcction, :io_datetime, :packing_pallet_id, :subprocess_id, :worker_id
  validates :direction, :presence => true
end
