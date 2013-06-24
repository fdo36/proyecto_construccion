class PalletFinishedProduct < ActiveRecord::Base
  attr_accessible :format_packing_id, :kind_id, :net_weight, :pack_packing_id, :quality, :quantity, :variety
end
