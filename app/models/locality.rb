class Locality < ActiveRecord::Base
  attr_accessible :commune_id, :name , :company_id
  belongs_to :commune
  has_many :producers
end
