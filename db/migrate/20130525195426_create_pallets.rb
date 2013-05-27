class CreatePallets < ActiveRecord::Migration
  def change
    create_table :pallets do |t|
      t.integer :code
      t.integer :quantity
      t.integer :price_per_unit
      t.integer :gross_weight
      t.integer :tare
      t.integer :variety_id
      t.integer :quality_id
      t.integer :receipt_id
      t.integer :pack_type_id
      t.integer :company_id
      t.integer :dispatch_id

      t.timestamps
    end
  end
end
