class CreateSuppliesProvidersLoans < ActiveRecord::Migration
  def change
    create_table :supplies_providers_loans do |t|
      t.integer :provider_id
      t.integer :supply_id
      t.integer :quantity
      t.integer :company_id

      t.timestamps
    end
  end
end
