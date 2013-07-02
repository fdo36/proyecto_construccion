class AddIsDeleteToTunnel < ActiveRecord::Migration
  def change
  	add_column :tunnels, :is_delete, :integer
  end
end
