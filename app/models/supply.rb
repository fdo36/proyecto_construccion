class Supply < ActiveRecord::Base
require "general"
	announce_component(:packing,"Inventario",1)

	validates :name, :description, :minimum_stock, :stock_ini, :presence => true
	  
	attr_accessible :description, :minimum_stock, :name , :stock_ini, :company_id

end
