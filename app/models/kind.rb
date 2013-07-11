require 'general'
class Kind < ActiveRecord::Base
  announce_component(:acopiopacking, "Recursos", 1)
  attr_accessible :name

  validates :name, :presence => true

  has_and_belongs_to_many :producers
  has_many :varieties
  has_many :seasons
  has_many :dispatches
  has_many :receipts

  belongs_to :final_packing_pallets
end
