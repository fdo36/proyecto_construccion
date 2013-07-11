class AddPaidToReceiptPackingIo < ActiveRecord::Migration
  def change
    add_column :receipt_packing_ios, :paid, :boolean
  end
end
