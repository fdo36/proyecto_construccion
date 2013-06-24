class AddAtributesToPackingPallet < ActiveRecord::Migration
  def change
    add_column :packing_pallets, :quantity, :integer
    add_column :packing_pallets, :gross_weight, :float
    add_column :packing_pallets, :unit_price, :integer
    add_column :packing_pallets, :tare, :float
    add_column :packing_pallets, :temperature, :float
  end
end
