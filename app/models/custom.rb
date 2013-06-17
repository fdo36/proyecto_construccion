#encoding: utf-8
require 'validators.rb'

class Custom < ActiveRecord::Base
  attr_accessible :address, :code, :email, :fax, :line_of_business, :location, :phone, :rut, :company_id, :user_id

  validates :line_of_business, :rut, :company_id, :user_id, :presence => true

  validates :code, :uniqueness => true

  validates :email, :format => { :with => /\A(([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,}))?\z/i,
    :message => "debe seguir el formato ejemplo@midominio.com" }
  
  validates :rut, :format => { :with => /^(\d{1,3}.\d{3}.\d{3}-)([a-zA-Z]{1}$|\d{1}$)/,
    :message => "debe ingresar el formato válido. Ejemplo: 11.111.111-1" }

  validates :phone, :format => { :with => /^-?((?:\d+|\d*)$)/,
    :message => "debe ingresar un número válido" }


  validates_with RutValidator
  #validates_with ValidatorProducerRutAlreadySaved

end
