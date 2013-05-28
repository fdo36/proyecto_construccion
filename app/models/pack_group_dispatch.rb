class PackGroupDispatch < ActiveRecord::Base
  attr_accessible :company_id, :dispatch_id, :gross_weight, :pack_type_id, :quality_id, :quantity, :variety_id
  belongs_to :company
  belongs_to :dispatch
  belongs_to :pack_type
  belongs_to :quality
  belongs_to :variety
end
