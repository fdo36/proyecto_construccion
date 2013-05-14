class RenameRightAccess < ActiveRecord::Migration
  def up
    rename_table :right_accesses, :access_rights
  end

  def down
    rename_table :access_rights, :right_accesses
  end
end
