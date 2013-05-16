class AddRegionsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :region, :integer
  end
end
