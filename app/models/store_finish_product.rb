class StoreFinishProduct < ActiveRecord::Base
  acts_as_heir_of :subprocess_io
  attr_accessible :store_time, :time_out, :direction, :io_datetime, :packing_pallet_id, :subprocess_id, :worker_id, :heir_id, :heir_type
end
