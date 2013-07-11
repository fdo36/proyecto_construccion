class Provider < ActiveRecord::Base

  announce_component(:packing,"Inventario",2)
  attr_accessible :active, :address, :commune_id, :contact, :email, :name, :phone, :rut
  validates :name, :rut, :phone, :contact, :email, :presence => true
end
