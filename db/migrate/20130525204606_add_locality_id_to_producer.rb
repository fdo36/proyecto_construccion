class AddLocalityIdToProducer < ActiveRecord::Migration
  def change
    add_column :producers, :locality_id, :integer
  end
end
