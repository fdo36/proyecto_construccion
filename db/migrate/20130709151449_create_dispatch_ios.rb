class CreateDispatchIos < ActiveRecord::Migration
  def change
    create_table :dispatch_ios do |t|
      t.integer :number
      t.integer :charging_order_id
      t.string :container_code
      t.float :charging_temperature
      t.float :dispatch_temperature
      t.string :name_driver
      t.string :rut_driver
      t.string :patent
      t.string :nave
      t.string :reservation
      t.string :stamp_number
      t.string :thermograph
      t.string :dispatch_guide
      t.string :po_number

      t.timestamps
    end
  end
end
