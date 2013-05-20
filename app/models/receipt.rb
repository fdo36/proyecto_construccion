class Receipt < ActiveRecord::Base
  attr_accessible :code, :date, :hour, :kind_id, :producer_id
  has_many :pallets
end
