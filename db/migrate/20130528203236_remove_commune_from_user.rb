class RemoveCommuneFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :commune
  end

  def down
    add_column :users, :commune, :string
  end
end
