class Locality < ActiveRecord::Base
  attr_accessible :commune_id, :name
  belongs_to :commune
  has_many :producers
end
