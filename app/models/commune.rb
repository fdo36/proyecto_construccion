class Commune < ActiveRecord::Base
  attr_accessible :name, :region_id

  belongs_to :region
  has_many :producers
  has_many :destinations
end
