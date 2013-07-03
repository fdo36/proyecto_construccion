class RemoveRutFromWorker < ActiveRecord::Migration
  def up
    remove_column :workers, :rut
  end

  def down
    add_column :workers, :rut, :integer
  end
end
