class ReceiptPackingIo < ActiveRecord::Base
  acts_as_heir_of :subprocess_io
  attr_accessible :code, :comments, :dispatch_guide_number, :pack_type_id, :producer_id, :trazability_code, :packing_pallet_id, :worker_id, :direction, :kind_id
  belongs_to :producer
end
