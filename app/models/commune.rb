class Commune < ActiveRecord::Base
  attr_accessible :name, :region_id
  #trytuytut
  belongs_to :region
  has_many :producers
  has_many :destinations
  has_many :companies
  has_many :localities
end
