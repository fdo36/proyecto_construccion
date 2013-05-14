class AccessRight < ActiveRecord::Base
  attr_accessible :model_name, :action
  belongs_to :role
end
