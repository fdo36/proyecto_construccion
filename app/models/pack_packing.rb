#encoding: utf-8

class PackPacking < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

end
