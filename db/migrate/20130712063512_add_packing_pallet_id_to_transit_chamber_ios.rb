class AddPackingPalletIdToTransitChamberIos < ActiveRecord::Migration
  def change
    add_column :transit_chamber_ios, :packing_pallet_id, :integer
  end
end
