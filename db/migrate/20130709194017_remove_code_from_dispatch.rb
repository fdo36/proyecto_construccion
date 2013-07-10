class RemoveCodeFromDispatch < ActiveRecord::Migration
  def up
    remove_column :dispatches, :code
  end

  def down
    add_column :dispatches, :code, :string
  end
end
