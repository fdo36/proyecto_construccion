class RemoveRightFromAccessRight < ActiveRecord::Migration
  def up
    remove_column :access_rights, :right
  end

  def down
    add_column :access_rights, :right, :integer
  end
end
