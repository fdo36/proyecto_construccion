class Supply < ActiveRecord::Base

	  validates :name, :description, :minimum_stock, :stock_ini, :presence => true
	  
	  attr_accessible :description, :minimum_stock, :name , :stock_ini

end
