class SuppliesProvidersLoan < ActiveRecord::Base
	
  	require "general"
	announce_component(:packing,"Inventario",3)
  	attr_accessible :company_id, :provider_id, :quantity, :supply_id , :dispatch_guide_number

end
