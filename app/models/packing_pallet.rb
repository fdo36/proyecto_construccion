class PackingPallet < ActiveRecord::Base
  attr_accessible :gross_weight, :pack_type, :quantity, :tare, :temperature, :unit_price

  validates :gross_weight, :pack_type, :quantity, :tare, :temperature, :unit_price, :presence => true

  validates :tare, :gross_weight, :temperature, :unit_price, :numericality => true

  validates :quantity, :numericality => { :only_integer => true }
end
