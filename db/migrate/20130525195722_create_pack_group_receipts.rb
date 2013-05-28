class CreatePackGroupReceipts < ActiveRecord::Migration
  def change
    create_table :pack_group_receipts do |t|
      t.integer :price_per_unit
      t.integer :quantity
      t.integer :gross_weight
      t.integer :pack_type_id
#      t.foreign_key :pack_types
      t.integer :variety_id
      t.foreign_key :varieties
      t.integer :quality_id
      t.foreign_key :qualities
      t.integer :receipt_id
      t.foreign_key :receipts
      t.integer :company_id
      t.timestamps
    end
  end
end
