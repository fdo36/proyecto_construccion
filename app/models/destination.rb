#encoding: utf-8
require 'validators.rb'
class Destination < ActiveRecord::Base
  attr_accessible :active, :address, :commune_id, :name, :contact, :email, :phone, :rut, :is_deleted

<<<<<<< HEAD
  validates :address, :commune_id, :company_name, :contact, :phone, :rut, :presence => true
=======
  validates :address, :commune_id, :name, :contact, :email, :phone, :rut, :presence => true
>>>>>>> c5d3da07b5fd8f82755cd68642f221c448c33df2

  #:presence => true
  validates :email, :format => { :with => /\A(([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,}))?\z/i,
    :message => "debe seguir el formato ejemplo@midominio.com" }

  validates :phone, :format => { :with => /^-?((?:\d+|\d*)$)/,
    :message => "debe ingresar un número válido" }

  validates :rut, :format => { :with => /^(\d{1,3}.\d{3}.\d{3}-)([a-zA-Z]{1}$|\d{1}$)/,
    :message => "debe ingresar el formato válido. Ejemplo: 11.111.111-1" }

  validates_with RutValidator
  #validates_with ValidatorDestinationRutAlreadySaved

  belongs_to :commune
  has_many :dispatches
  has_many :producers
  has_many :receipts
end
