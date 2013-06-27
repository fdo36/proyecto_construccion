class CreateFrozenTunnels < ActiveRecord::Migration
  def change
    create_table :frozen_tunnels do |t|
      t.integer :order_number
      t.integer :tunnel_id
      t.double :tunnel_temperature
      t.double :packing_pallet_temperature

      t.timestamps
    end
  end
end
