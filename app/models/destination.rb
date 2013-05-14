class Destination < ActiveRecord::Base
  attr_accessible :active, :address, :commune_id, :company_name, :contact, :email, :phone, :rut

  belongs_to :commune
end
