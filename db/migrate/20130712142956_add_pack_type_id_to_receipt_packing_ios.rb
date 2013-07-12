class AddPackTypeIdToReceiptPackingIos < ActiveRecord::Migration
  def change
    add_column :receipt_packing_ios, :pack_type_id, :integer
  end
end
