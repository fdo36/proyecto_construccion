class AddRegionToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :region, :string
  end
end
