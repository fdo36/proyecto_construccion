#encoding: utf-8
class Destination < ActiveRecord::Base
  attr_accessible :active, :address, :commune_id, :company_name, :contact, :email, :phone, :rut, :is_deleted

  validates :address, :commune_id, :company_name, :contact, :email, :phone, :rut, :presence => true

  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    :message => "debe seguir el formato ejemplo@midominio.com" }
  
  validates :phone, :format => { :with => /^-?((?:\d+|\d*)$)/,
    :message => "debe ingresar un número válido" }

  validates :rut, :format => { :with => /^(\d{2}\d{3}\d{3}-)([a-zA-Z]{1}$|\d{1}$)/,
    :message => "debe ingresar el formato válido. Ejemplo: 11111111-1" }

  belongs_to :commune
end
