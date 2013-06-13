class AddHeirIdToSubprocessIo < ActiveRecord::Migration
  def change
    add_column :subprocess_ios, :heir_id, :integer
  end
end
