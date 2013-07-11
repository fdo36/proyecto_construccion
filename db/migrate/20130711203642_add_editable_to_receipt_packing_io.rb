class AddEditableToReceiptPackingIo < ActiveRecord::Migration
  def change
    add_column :receipt_packing_ios, :editable, :boolean
  end
end
