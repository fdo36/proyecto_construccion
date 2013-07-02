class AddPalletCodeToPackingPallet < ActiveRecord::Migration
  def change
    add_column :packing_pallets, :pallet_code, :string
  end
end
