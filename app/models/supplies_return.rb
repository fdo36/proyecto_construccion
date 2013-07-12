class SuppliesReturn < ActiveRecord::Base
	require "general"
	announce_component(:packing,"Inventario",5)
  	attr_accessible :company_id, :quantity, :supply_id, :worker_id
  
end
