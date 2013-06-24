class CreatePalletFinishedProducts < ActiveRecord::Migration
  def change
    create_table :pallet_finished_products do |t|
      t.integer :kind_id
      t.integer :variety
      t.integer :quality
      t.integer :pack_packing_id
      t.integer :format_packing_id
      t.integer :quantity
      t.float :net_weight

      t.timestamps
    end
  end
end
