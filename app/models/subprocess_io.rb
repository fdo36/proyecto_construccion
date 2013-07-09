class SubprocessIo < ActiveRecord::Base

  acts_as_predecessor
  attr_accessible :direction, :io_datetime, :packing_pallet_id, :subprocess_id, :worker_id
  belongs_to :packing_pallet
  belongs_to :worker
  belongs_to :subprocess
end

