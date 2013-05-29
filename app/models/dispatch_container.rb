class DispatchContainer < ActiveRecord::Base
  attr_accessible :container_id, :dispatch_id, :gross_weight, :quality_id, :quantity, :variety_id

  has_one :container, :dispatch, :quality, :variety
end
