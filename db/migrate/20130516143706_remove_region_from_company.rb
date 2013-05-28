class RemoveRegionFromCompany < ActiveRecord::Migration
  def up
    remove_column :companies, :region
  end

  def down
    add_column :companies, :region, :integer
  end
end
