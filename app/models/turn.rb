class Turn < ActiveRecord::Base
  attr_accessible :end_datetime, :name, :start_datetime, :subprocess_id
end
