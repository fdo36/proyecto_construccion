class AddCompanyIdToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :company_id, :integer
  end
end
