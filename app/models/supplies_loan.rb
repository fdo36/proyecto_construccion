class SuppliesLoan < ActiveRecord::Base
	require "general"
	announce_component(:packing,"Inventario",4)
  
  	attr_accessible :company_id, :quantity, :supply_id, :worker_id
  	validates :worker_id, :quantity, :supply_id , :presence => true

end
