class EmptyPacksDestinationMove < ActiveRecord::Base
  attr_accessible :company_id, :destination_id, :pack_option, :pack_type_id, :quantity, :code
  
  belongs_to :destination ,:dependent => :destroy
  has_one :pack_types
end
