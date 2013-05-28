class AccessRight < ActiveRecord::Base
  validates :model_name, :presence => true
  validates :action, :presence => true
  attr_accessible :model_name, :action, :company_id
  belongs_to :role
  belongs_to :company
end
