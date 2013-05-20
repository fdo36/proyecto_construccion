class Pallet < ActiveRecord::Base
  attr_accessible :code, :container_id, :gross_weight, :price_kg, :quality_id, :quantity, :receipt_id, :tare, :variety_id
end
