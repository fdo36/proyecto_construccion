#encoding: utf-8
require 'validators.rb'
require "general"

class Destination < ActiveRecord::Base
  announce_component(:acopio, "Recursos", 1)

  attr_accessible :code, :active, :address, :commune_id, :name, :contact, :email, :phone, :rut, :is_deleted

  validates :code, :address, :commune_id, :name, :contact, :phone, :rut, :presence => true

  validates :code, :uniqueness => true
  #:presence => true
  validates :email, :format => { :with => /\A(([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,}))?\z/i,
    :message => "debe seguir el formato ejemplo@midominio.com" }

  validates :rut, :format => { :with => /^(\d{1,3}.\d{3}.\d{3}-)([a-zA-Z]{1}$|\d{1}$)/,
    :message => "debe ingresar el formato válido. Ejemplo: 11.111.111-1" }

  validates_with RutValidator
  #validates_with ValidatorDestinationRutAlreadySaved

  has_one :dispatch
  belongs_to :commune
  has_many :dispatches
  has_many :producers
  has_many :receipts
  has_many :empty_packs_destination_moves
end
