#encoding: utf-8
class Company < ActiveRecord::Base
  
  validates :name, :presence => true
  validates :rut, :presence => true
  validates :email, :presence => true
 

  validates :phone, :format => { :with => /^-?((?:\d+|\d*)$)/,
    :message => "debe ingresar un número válido" }
  
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    :message => "debe seguir el formato ejemplo@midominio.com" }

  validates :rut, :format => { :with => /^(\d{2}.\d{3}.\d{3}-)([a-zA-Z]{1}$|\d{1}$)/,
    :message => "debe ingresar el formato válido. Ejemplo: 11.111.111-1" }

  
  attr_accessible :address, :commune_id, :email, :line_of_business, :name, :phone, :rut , :active, :region_id
  
  has_many :users
  belongs_to :commune
  belongs_to :region
  has_many :receipts
  has_many :dispatches
end

