class Dispatch < ActiveRecord::Base
  attr_accessible :company_id, :destination_id, :dispatch_datetime, :kind_id, :user_id
  belongs_to :company
  belongs_to :destination
  belongs_to :kind
  belongs_to :user
  has_many :pallets
  has_many :pack_group_dispatches
end
