class Company < ActiveRecord::Base
  attr_accessible :address, :city, :email, :line_of_business, :name, :phone, :rut
end

