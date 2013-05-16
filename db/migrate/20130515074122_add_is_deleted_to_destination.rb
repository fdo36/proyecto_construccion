class AddIsDeletedToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :is_deleted, :boolean
  end
end
