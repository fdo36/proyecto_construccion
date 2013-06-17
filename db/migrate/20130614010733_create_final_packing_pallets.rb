class CreateFinalPackingPallets < ActiveRecord::Migration
  def change
    create_table :final_packing_pallets do |t|
      t.integer :kind_id
      t.integer :variety_id
      t.integer :quality_id
      t.integer :pack_packing_id
      t.integer :format_id
      t.integer :quantity
      t.float :net_weight

      t.foreign_key :kinds
      t.foreign_key :varieties
      t.foreign_key :qualities

      t.timestamps
    end
  end
end
