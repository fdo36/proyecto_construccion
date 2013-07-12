class AddCodeToEmptyPacksDestinationMove < ActiveRecord::Migration
  def change
    add_column :empty_packs_destination_moves, :code, :integer
  end
end
