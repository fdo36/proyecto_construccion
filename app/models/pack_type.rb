#encoding: utf-8
require "general"

class PackType < ActiveRecord::Base
  announce_component(:acopiopacking, "Recursos", 4)

  attr_accessible :company_id, :name, :tare

  validates :name, :tare, :presence => true

  validates :tare, :numericality => { :greater_than => 0 }
   #validates :tare, :format => { :with => /^-?[0-9]+([,\.][0-9]*)?$/, 
   	#:message => "debe ser un número válido" }

  belongs_to :company
  has_many :pack_group_receipts
  has_many :pack_group_dispatches
  has_many :pallets
  has_and_belongs_to_many :producers
  has_many :empty_packs_producer_moves
  has_many :empty_packs_destination_moves

end