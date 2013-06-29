class Provider < ActiveRecord::Base
  attr_accessible :active, :address, :commune, :contacto, :email, :name, :phone, :rut
end
