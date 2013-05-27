class Pallet < ActiveRecord::Base
  attr_accessible :code, :company_id, :dispatch_id, :gross_weight, :pack_type_id, :price_per_unit, :quality_id, :quantity, :receipt_id, :tare, :variety_id
  belongs_to :variety
  belongs_to :quality
  belongs_to :receipt
  belongs_to :pack_type
  belongs_to :company
  belongs_to :dispatch
end
