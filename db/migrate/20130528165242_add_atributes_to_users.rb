class AddAtributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :region_id, :integer
    add_column :users, :commune, :integer
  end
end
