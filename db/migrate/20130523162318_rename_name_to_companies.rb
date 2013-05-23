class RenameNameToCompanies < ActiveRecord::Migration
  def up
  	rename_column :companies, :city_id, :commune_id
  end

  def down
  	rename_column :companies, :commune_id, :city_id
  end
end
