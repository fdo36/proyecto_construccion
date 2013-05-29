class Company < ActiveRecord::Base
  
  validates :name, :presence => true
  validates :rut, :presence => true
  validates :email, :presence => true
 


  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    :message => "debe seguir el formato ejemplo@midominio.com" }
  attr_accessible :address, :commune_id, :email, :line_of_business, :name, :phone, :rut , :active, :region_id
  
  has_many :users
  belongs_to :commune
  belongs_to :region
  has_many :receipts
  has_many :dispatches
end

