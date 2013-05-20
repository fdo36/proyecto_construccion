class CreatePallets < ActiveRecord::Migration
  def change
    create_table :pallets do |t|
      t.integer :receipt_id
      t.foreign_key :receipts
      t.integer :container_id
      t.foreign_key :containers
      t.integer :quality_id
      t.foreign_key :qualities
      t.integer :variety_id
      t.foreign_key :varieties
      t.float :price_kg
      t.integer :quantity
      t.float :gross_weight
      t.string :code
      t.float :tare

      t.timestamps
    end
  end
end