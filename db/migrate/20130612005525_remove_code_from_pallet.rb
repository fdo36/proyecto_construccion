class RemoveCodeFromPallet < ActiveRecord::Migration
  def up
    remove_column :pallets, :code
  end

  def down
    add_column :pallets, :code, :integer
  end
end
