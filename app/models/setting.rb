class Setting < ActiveRecord::Base
  attr_accessible :company_id, :key, :value
  belongs_to :company
end
