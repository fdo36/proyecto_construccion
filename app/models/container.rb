class Container < ActiveRecord::Base
  attr_accessible :name, :tare

  validates :name, :tare, :presence => true

  has_and_belongs_to_many :producers
end
