require "general"

class Grouping < ActiveRecord::Base
  announce_component(:acopio, "Recursos", 2)

  attr_accessible :description, :name, :company_id

  validates :description, :name, :presence => true

  has_and_belongs_to_many :producers
end
