class AddReceiptPackingIoDatetimeToReceiptPackingIos < ActiveRecord::Migration
  def change
    add_column :receipt_packing_ios, :receipt_packing_io_datetime, :datetime
  end
end
