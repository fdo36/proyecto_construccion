class DispatchIo < ActiveRecord::Base
  attr_accessible :charging_order_id, :charging_temperature, :container_code, :dispatch_temperature, :name_driver, :number, :patent, :rut_driver
end
