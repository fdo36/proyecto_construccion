class SuppliesLoan < ActiveRecord::Base
  attr_accessible :company_id, :quantity, :supply_id, :worker_id
  validates :worker_id, :quantity, :supply_id , :presence => true

end
