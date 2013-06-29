class Quality < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true
  has_many :pack_group_receipts
  has_many :pack_group_dispatches
  has_many :pallets

  belongs_to :final_packing_pallets
end
