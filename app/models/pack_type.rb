#encoding: utf-8
class PackType < ActiveRecord::Base
  attr_accessible :company_id, :name, :tare

  validates :name, :tare, :presence => true

  validates :tare, :format => { :with => /^-?(?:\d+|\d*\.\d+)$/, 
  	:message => "debe ser un número válido" }

  belongs_to :company_id
  has_many :pack_group_receipts
  has_many :pack_group_dispatches
  has_many :pallets
  has_and_belongs_to_many :producers
end