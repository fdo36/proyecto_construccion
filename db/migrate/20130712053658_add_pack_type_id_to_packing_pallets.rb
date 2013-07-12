class AddPackTypeIdToPackingPallets < ActiveRecord::Migration
  def change
    add_column :packing_pallets, :pack_type_id, :integer
  end
end
