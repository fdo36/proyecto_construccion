#encoding: utf-8
class Container < ActiveRecord::Base
  attr_accessible :name, :tare

  validates :name, :tare, :presence => true

   validates :tare, :format => { :with => /^-?(?:\d+|\d*\.\d+)$/, 
   	:message => "debe ser un número válido" }

  has_one :pallet, :receipt_container, :dispatch_container
  has_and_belongs_to_many :producers
end
