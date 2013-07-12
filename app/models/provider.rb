class Provider < ActiveRecord::Base
	
	require "general"
	announce_component(:packing,"Inventario",2)
 
  	attr_accessible :active, :address, :commune_id, :contact, :email, :name, :phone, :rut, :company_id
  	validates :name, :rut, :phone, :contact, :email, :presence => true
end
