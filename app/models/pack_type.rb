class PackType < ActiveRecord::Base
  attr_accessible :company_id, :name, :tare
  belongs_to :company_id
  has_many :pack_group_receipts
  has_many :pack_group_dispatches
  has_many :pallets
end
