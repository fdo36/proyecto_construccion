class Variety < ActiveRecord::Base
  attr_accessible :kind_id, :name

  validates :kind_id, :name, :presence => true

  belongs_to :kind
  has_one :pallet, :receipt_container, :dispatch_container
end
