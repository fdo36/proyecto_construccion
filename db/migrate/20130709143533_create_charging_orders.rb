class CreateChargingOrders < ActiveRecord::Migration
  def change
    create_table :charging_orders do |t|
      t.integer :custom_agent_id
      t.integer :origin_port_id
      t.integer :destination_port_id

      t.timestamps
    end
  end
end
