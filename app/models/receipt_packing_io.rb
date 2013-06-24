class ReceiptPackingIo < ActiveRecord::Base
  attr_accessible :code, :comments, :dispatch_guide_number, :pack_type, :producer_id, :trazability_code
end
