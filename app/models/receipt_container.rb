class ReceiptContainer < ActiveRecord::Base
  attr_accessible :container_id, :gross_weight, :price_kg, :quality_id, :quantity, :receipt_id, :variety_id
end
