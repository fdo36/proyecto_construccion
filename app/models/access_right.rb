class AccessRight < ActiveRecord::Base
  validates :model_name, :presence => true
  validates :action, :presence => true
  attr_accessible :model_name, :action
  belongs_to :role
end
