class CreateSuppliesReturns < ActiveRecord::Migration
  def change
    create_table :supplies_returns do |t|
      t.integer :worker_id
      t.integer :supply_id
      t.integer :company_id
      t.integer :quantity

      t.timestamps
    end
  end
end
