class AddVarietyIdToPackingPallet < ActiveRecord::Migration
  def change
    add_column :packing_pallets, :variety_id, :integer
  end
end
