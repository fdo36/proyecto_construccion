class CreatePallets < ActiveRecord::Migration
  def change
    create_table :pallets do |t|
      t.integer :code
      t.integer :quantity
      t.integer :price_per_unit
      t.integer :gross_weight
      t.integer :tare
      t.integer :variety_id
      t.foreign_key :varieties
      t.integer :quality_id
      t.foreign_key :qualities
      t.integer :receipt_id
      t.foreign_key :receipts
      t.integer :pack_type_id
      t.foreign_key :pack_types
      t.integer :company_id
      t.integer :dispatch_id

      t.timestamps
    end
  end
end
