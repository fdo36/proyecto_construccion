class Quality < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  has_one :pallet, :receipt_container, :dispatch_container

end
