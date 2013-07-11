require "general"

class Quality < ActiveRecord::Base
  announce_component(:acopiopacking, "Recursos", 6)

  attr_accessible :name

  validates :name, :presence => true
  has_many :pack_group_receipts
  has_many :pack_group_dispatches
  has_many :pallets

  belongs_to :final_packing_pallets
end
