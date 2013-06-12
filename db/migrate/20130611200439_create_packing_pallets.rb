class CreatePackingPallets < ActiveRecord::Migration
  def change
    create_table :packing_pallets do |t|

      t.timestamps
    end
  end
end
