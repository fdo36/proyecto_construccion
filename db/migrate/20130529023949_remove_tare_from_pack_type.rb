class RemoveTareFromPackType < ActiveRecord::Migration
  def up
    remove_column :pack_types, :tare
  end

  def down
    add_column :pack_types, :tare, :integer
  end
end
