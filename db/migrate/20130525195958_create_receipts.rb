class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :code
      t.datetime :receipt_datetime
      t.integer :producer_id
      t.integer :kind_id
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
