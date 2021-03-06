#encoding: utf-8
require 'validators.rb'
require "general"

class Producer < ActiveRecord::Base
  announce_component(:acopio, "Recursos", 5)
  
  attr_accessible :active, :address, :commune_id, :name, :contact, :email, :line_of_business, :phone, :rut, :sag_code, :is_deleted, :code, :company_id

  validates :address, :commune_id, :name, :contact, :line_of_business, :phone, :rut, :sag_code, :code, :presence => true

  validates :code, :uniqueness => true

  validates :email, :format => { :with => /\A(([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,}))?\z/i,
    :message => "debe seguir el formato ejemplo@midominio.com" }
  
  validates :rut, :format => { :with => /^(\d{1,3}.\d{3}.\d{3}-)([a-zA-Z]{1}$|\d{1}$)/,
    :message => "debe ingresar el formato válido. Ejemplo: 11.111.111-1" }

  validates :code, :format => { :with => /^-?((?:\d+|\d*)$)/,
    :message => "debe ingresar un número válido" }

  validates_with RutValidator
  #validates_with ValidatorProducerRutAlreadySaved


  belongs_to :commune
  has_many :receipts
  belongs_to :locality
  has_and_belongs_to_many :groupings
  has_and_belongs_to_many :kinds
  has_and_belongs_to_many :pack_types
  has_many :empty_packs_producer_moves

  has_and_belongs_to_many :kinds

end
