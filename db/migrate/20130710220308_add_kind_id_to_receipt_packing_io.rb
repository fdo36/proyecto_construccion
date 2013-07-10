class AddKindIdToReceiptPackingIo < ActiveRecord::Migration
  def change
    add_column :receipt_packing_ios, :kind_id, :integer
  end
end
