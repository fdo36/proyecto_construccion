class SuppliesLoan < ActiveRecord::Base
  attr_accessible :company_id, :quantity, :supply_id, :worker_id
end
