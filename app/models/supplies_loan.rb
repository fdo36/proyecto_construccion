class SuppliesLoan < ActiveRecord::Base
  attr_accessible :company_id, :quantity, :supply_id, :worker_id

  #s = Supply.find(:supply_id)

  #min = (Supply.all(:select => "minimum_stock", :conditions => ["id = ?", s.id]))[0].minimum_stock
  #stock = (Supply.all(:select => "stock_ini", :conditions => ["id = ?", s.id]))[0].stock_ini

  #validates :quantity, :numericality => { :greater_than_or_equal_to => min, :less_than_or_equal_to => stock }
  
end
