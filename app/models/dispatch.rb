class Dispatch < ActiveRecord::Base
  attr_accessible :code, :date, :destination_id, :hour, :kind_id

  belongs_to :dispatch_container
  has_one :destination, :kind
end
