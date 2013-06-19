class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :name
      t.string :description
      t.integer :minimum_stock

      t.timestamps
    end
  end
end
