class CreateSuppliesLoans < ActiveRecord::Migration
  def change
    create_table :supplies_loans do |t|
      t.integer :worker_id
      t.integer :supply_id
      t.integer :quantity
      t.integer :company_id

      t.timestamps
    end
  end
end
