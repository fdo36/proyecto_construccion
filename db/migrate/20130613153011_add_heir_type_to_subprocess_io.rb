class AddHeirTypeToSubprocessIo < ActiveRecord::Migration
  def change
    add_column :subprocess_ios, :heir_type, :string
  end
end
