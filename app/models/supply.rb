class Supply < ActiveRecord::Base
  attr_accessible :description, :minimum_stock, :name
end
