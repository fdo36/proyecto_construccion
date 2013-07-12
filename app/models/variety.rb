require "general"

class Variety < ActiveRecord::Base
  announce_component(:acopiopacking, "Recursos", 7)

  attr_accessible :kind_id, :name

  validates :kind_id, :name, :presence => true

  belongs_to :kind
  belongs_to :final_packing_pallets
  
  has_many :pack_group_receipts
  has_many :pack_group_dispatches
  has_many :pallets
end
