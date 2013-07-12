require "general"

class PackingPallet < ActiveRecord::Base
  announce_component(:packing, "Recursos", 1)

  attr_accessible :gross_weight, :pack_type_id, :quantity, :tare, 
  :temperature, :unit_price, :pallet_code, :producer_id, :receipt_packing_io_id, :variety_id

  validates :gross_weight, :pack_type_id, :quantity, :tare, :temperature, :unit_price, 
  :pallet_code, :producer_id, :presence => true

  validates :tare, :gross_weight, :temperature, :unit_price, :numericality => true

  validates :quantity, :numericality => { :only_integer => true }

  belongs_to :transit_chamber_io
  belongs_to :stabilization_chamber_io
  belongs_to :production_process_io
  belongs_to :receipt_packing_io
  belongs_to :frozen_tunnel_io
  belongs_to :receipt_packing_io
  belongs_to :variety_id
end
