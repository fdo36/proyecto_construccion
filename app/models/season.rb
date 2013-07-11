class Season < ActiveRecord::Base
  announce_component(:acopio, "Entradas/Salidas", 3)  
  attr_accessible :end_date, :init_date, :is_active, :is_delete, :kind_id
  belongs_to :kind
end
