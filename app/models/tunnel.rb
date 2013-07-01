class Tunnel < ActiveRecord::Base
  attr_accessible :name, :is_delete
  validates :name, :presence => true
end
