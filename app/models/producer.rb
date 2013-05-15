class Producer < ActiveRecord::Base
  attr_accessible :active, :address, :commune_id, :company_name, :contact, :email, :line_of_business, :phone, :rut, :sag_code

  validates :active, :address, :commune_id, :company_name, :contact, :email, :line_of_business, :phone, :rut, :sag_code, :presence => true

  belongs_to :commune
  has_and_belongs_to_many :groupings
  has_and_belongs_to_many :kinds
  has_and_belongs_to_many :containers
end