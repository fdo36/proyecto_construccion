# encoding: utf-8
require 'validators.rb'

class Worker < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :phone, :rut

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :rut, :presence => true
  validates :phone, :presence => true

  has_many :subprocess_io

#  validates :rut, :format => { :with => /^(\d{1,3}.\d{3}.\d{3}-)([a-zA-Z]{1}$|\d{1}$)/,
#    :message => "debe ingresar el formato válido. Ejemplo: 11.111.111-1" }

#  validates :phone, :code, :format => { :with => /^-?((?:\d+|\d*)$)/,
#	:message => "debe ingresar un número válido" }

#	validates_with RutValidator
  #validates_with ValidatorProducerRutAlreadySaved

end
