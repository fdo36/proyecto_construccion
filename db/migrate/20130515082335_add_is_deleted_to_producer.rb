class AddIsDeletedToProducer < ActiveRecord::Migration
  def change
    add_column :producers, :is_deleted, :boolean
  end
end
