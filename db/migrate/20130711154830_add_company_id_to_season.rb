class AddCompanyIdToSeason < ActiveRecord::Migration
  def change
    add_column :seasons, :company_id, :integer
  end
end
