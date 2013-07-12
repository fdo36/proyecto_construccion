class AddCodeToEmptyPacksProducerMove < ActiveRecord::Migration
  def change
    add_column :empty_packs_producer_moves, :code, :integer
  end
end
