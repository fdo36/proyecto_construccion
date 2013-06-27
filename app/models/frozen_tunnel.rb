class FrozenTunnel < ActiveRecord::Base
  attr_accessible :order_number, :packing_pallet_temperature, :tunnel_id, :tunnel_temperature
end
