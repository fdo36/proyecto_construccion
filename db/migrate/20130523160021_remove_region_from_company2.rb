class RemoveRegionFromCompany2 < ActiveRecord::Migration
  def up
    remove_column :companies, :region
    add_column :companies, :region_id, :integer 
  end

  def down
    add_column :companies, :region, :string
    remove_column :companies, :region_id, :integer
  end
end
