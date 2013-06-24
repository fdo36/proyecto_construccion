class CreateReceiptPackingIos < ActiveRecord::Migration
  def change
    create_table :receipt_packing_ios do |t|
      t.integer :producer_id
      t.integer :code
      t.string :pack_type
      t.integer :trazability_code
      t.integer :dispatch_guide_number
      t.string :comments

      t.timestamps
    end
  end
end
