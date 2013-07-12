class EmptyPacksProducerMove < ActiveRecord::Base
  attr_accessible :company_id, :pack_option, :pack_type_id, :producer_id, :quantity , :code

  belongs_to :producer
  has_one :pack_type
  
end
