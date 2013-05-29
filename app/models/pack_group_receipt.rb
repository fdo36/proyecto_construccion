class PackGroupReceipt < ActiveRecord::Base
  attr_accessible :company_id, :gross_weight, :pack_type_id, :price_per_unit, :quality_id, :quantity, :receipt_id, :variety_id
  belongs_to :company
  belongs_to :pack_type
  belongs_to :quality
  belongs_to :receipt
  belongs_to :variety

  validates  :gross_weight, :presence => true, :numericality => true

  validates :quantity, :pack_type_id,:price_per_unit,:quality_id, :receipt_id, :variety_id,:presence => true, :numericality => { :only_integer => true }

end
