class Season < ActiveRecord::Base
  attr_accessible :end_date, :init_date, :is_active, :is_delete, :kind_id
  belongs_to :kind
end
