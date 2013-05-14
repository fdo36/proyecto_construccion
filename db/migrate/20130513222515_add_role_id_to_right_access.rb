class AddRoleIdToRightAccess < ActiveRecord::Migration
  def change
    add_column :right_accesses, :role_id, :integer
  end
end
