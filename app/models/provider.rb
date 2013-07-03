class Provider < ActiveRecord::Base
  attr_accessible :active, :address, :commune_id, :contact, :email, :name, :phone, :rut
end
