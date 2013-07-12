require "general"

class FinalPackingPallet < ActiveRecord::Base
  announce_component(:packing, "Recursos", 2)
  attr_accessible :format_id, :kind_id, :net_weight, :pack_packing_id, :quality_id, :quantity, :variety_id

  validates :format_id, :kind_id, :net_weight, :pack_packing_id, :quality_id, :quantity, :variety_id, :presence => true

  validates :net_weight, :numericality => true

  validates :quantity, :numericality => { :only_integer => true }

  has_many :variety
  has_many :kind
  has_many :quality
end
