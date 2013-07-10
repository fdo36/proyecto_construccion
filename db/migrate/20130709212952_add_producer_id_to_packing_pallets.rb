class AddProducerIdToPackingPallets < ActiveRecord::Migration
  def change
    add_column :packing_pallets, :producer_id, :integer
  end
end
