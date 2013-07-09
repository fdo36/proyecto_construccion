require 'chronic'

class Receipt < ActiveRecord::Base
  attr_accessible :company_id, :kind_id, :producer_id, :receipt_datetime, :user_id
  belongs_to :company
  belongs_to :kind
  belongs_to :producer
  belongs_to :user
  has_many :pallets
  has_many :pack_group_receipts

  validates :receipt_datetime, :kind_id, :producer_id, :presence => true


end
