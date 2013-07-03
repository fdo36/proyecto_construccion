class AddStockToSupply < ActiveRecord::Migration
  def change
    add_column :supplies, :stock_ini, :integer
  end
end
