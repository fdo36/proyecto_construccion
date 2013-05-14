class AddActionToAccessRight < ActiveRecord::Migration
  def change
    add_column :access_rights, :action, :string
  end
end
