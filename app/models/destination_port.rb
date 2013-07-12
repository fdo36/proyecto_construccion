class DestinationPort < ActiveRecord::Base
  attr_accessible :name, :company_id

  validates :name, :presence => true
end
