class Grouping < ActiveRecord::Base
  attr_accessible :description, :name

  validates :description, :name, :presence => true

  has_and_belongs_to_many :producers
end
