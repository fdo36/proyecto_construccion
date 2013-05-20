class Company < ActiveRecord::Base
  
  validates :name, :presence => true
  validates :rut, :presence => true
  validates :email, :presence => true
  attr_accessible :address, :city, :email, :line_of_business, :name, :phone, :rut , :active
  
  has_many :users
  belongs_to :commune
  belongs_to :region
end

