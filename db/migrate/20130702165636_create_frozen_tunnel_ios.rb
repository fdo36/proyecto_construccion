class CreateFrozenTunnelIos < ActiveRecord::Migration
  def change
    create_table :frozen_tunnel_ios do |t|
      t.integer :order_number
      t.integer :tunnel_id
      t.float :tunnel_temperature
      t.float :packing_pallet_temperature

      t.timestamps
    end
  end
end
