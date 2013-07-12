#encoding: utf-8

class PackPacking < ActiveRecord::Base
  attr_accessible :name , :company_id

  validates :name, :presence => true

end
