class DispatchContainer < ActiveRecord::Base
  attr_accessible :container_id, :dispatch_id, :gross_weight, :quality_id, :quantity, :variety_id, :company_id

  has_one :container
  has_one :dispatch
  has_one :quality
  has_one :variety
end
