class CreatePackingPallets < ActiveRecord::Migration
  def change
    create_table :packing_pallets do |t|
      t.string :pack_type
      t.integer :quantity
      t.float :tare
      t.float :temperature
      t.integer :gross_weight
      t.integer :unit_price

      t.timestamps
    end
  end
end
