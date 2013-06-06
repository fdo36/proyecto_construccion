class EmptyPacksDestinationMove < ActiveRecord::Base
  attr_accessible :company_id, :destination_id, :pack_option, :pack_type_id, :quantity
  belongs_to :destinations
  has_one :pack_types
end
