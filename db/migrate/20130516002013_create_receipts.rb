class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :code
      t.integer :producer_id
      t.foreign_key :producers
      t.integer :kind_id
      t.foreign_key :kinds
      t.date :date
      t.datetime :hour

      t.timestamps
    end
  end
end