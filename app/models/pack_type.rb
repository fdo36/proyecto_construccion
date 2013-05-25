class PackType < ActiveRecord::Base
  attr_accessible :company_id, :name, :tare
  belongs_to :company_id
end
