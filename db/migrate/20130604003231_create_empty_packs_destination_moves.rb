class CreateEmptyPacksDestinationMoves < ActiveRecord::Migration
  def change
    create_table :empty_packs_destination_moves do |t|
      t.integer :company_id
      t.integer :destination_id
      t.integer :pack_type_id
      t.integer :quantity
      t.string :pack_option

      t.timestamps
    end
  end
end
