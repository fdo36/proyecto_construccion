#encoding: utf-8
class Producer < ActiveRecord::Base
  attr_accessible :active, :address, :commune_id, :name, :contact, :email, :line_of_business, :phone, :rut, :sag_code, :is_deleted

  validates :address, :commune_id, :name, :contact, :email, :line_of_business, :phone, :rut, :sag_code, :presence => true
  
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    :message => "debe seguir el formato ejemplo@midominio.com" }

  validates :rut, :format => { :with => /^(\d{2}\d{3}\d{3}-)([a-zA-Z]{1}$|\d{1}$)/,
    :message => "debe ingresar el formato válido. Ejemplo: 11111111-1" }

  validates :phone, :format => { :with => /^-?((?:\d+|\d*)$)/,
    :message => "debe ingresar un número válido" }

  belongs_to :commune
  has_many :receipts
  belongs_to :locality
  has_and_belongs_to_many :groupings
  has_and_belongs_to_many :kinds
  has_and_belongs_to_many :containers
end
