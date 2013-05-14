class Variety < ActiveRecord::Base
  attr_accessible :kind_id, :name

  belongs_to :kind
end
