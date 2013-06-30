class AddPackTypeToPackingPallet < ActiveRecord::Migration
  def change
    add_column :packing_pallets, :pack_type, :integer
  end
end
