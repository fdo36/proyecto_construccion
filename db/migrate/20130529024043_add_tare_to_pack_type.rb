class AddTareToPackType < ActiveRecord::Migration
  def change
    add_column :pack_types, :tare, :float
  end
end
