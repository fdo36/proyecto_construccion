class Variety < ActiveRecord::Base
  attr_accessible :kind_id, :name

  validates :kind_id, :name, :presence => true

  belongs_to :kind
end
