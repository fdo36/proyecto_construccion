class AddPaymentDateToReceiptPackingIo < ActiveRecord::Migration
  def change
    add_column :receipt_packing_ios, :payment_date, :datetime
  end
end
