class Provider < ActiveRecord::Base

  attr_accessible :active, :address, :commune_id, :contact, :email, :name, :phone, :rut
  validates :name, :rut, :phone, :contact, :email, :presence => true
end
