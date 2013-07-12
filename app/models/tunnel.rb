class Tunnel < ActiveRecord::Base
  attr_accessible :name, :is_delete, :company_id
  validates :name, :presence => true
end
