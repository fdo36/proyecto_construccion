class ChargingOrder < ActiveRecord::Base
  acts_as_heir_of :subprocess_io
  attr_accessible :custom_agent_id, :destination_port_id, :origin_port_id :direction, :io_datetime, :packing_pallet_id, :subprocess_id, :worker_id, :heir_id, :heir_type
  has_one :dispatch_io
end
