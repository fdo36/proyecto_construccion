class AddUserIdToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :user_id, :integer
  end
end
