class PackingPallet < ActiveRecord::Base
  attr_accessible :gross_weight, :pack_type_id, :quantity, :tare, :temperature, :unit_price, :pallet_code

  validates :gross_weight, :pack_type_id, :quantity, :tare, :temperature, :unit_price, :pallet_code, :presence => true

  validates :tare, :gross_weight, :temperature, :unit_price, :numericality => true

  validates :quantity, :numericality => { :only_integer => true }
end
