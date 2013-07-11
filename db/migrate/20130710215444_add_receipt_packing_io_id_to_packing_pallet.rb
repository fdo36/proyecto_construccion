class AddReceiptPackingIoIdToPackingPallet < ActiveRecord::Migration
  def change
    add_column :packing_pallets, :receipt_packing_io_id, :integer
  end
end
