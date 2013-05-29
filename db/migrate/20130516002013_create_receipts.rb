class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :code
      t.integer :producer_id
      t.foreign_key :producers
      t.integer :kind_id
      t.foreign_key :kinds
      t.datetime :receipt_datetime
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
