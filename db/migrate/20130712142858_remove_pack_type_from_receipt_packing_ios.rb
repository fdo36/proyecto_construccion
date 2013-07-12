class RemovePackTypeFromReceiptPackingIos < ActiveRecord::Migration
  def up
    remove_column :receipt_packing_ios, :pack_type
  end

  def down
    add_column :receipt_packing_ios, :pack_type, :string
  end
end
