class AddCompanyIdToGrouping < ActiveRecord::Migration
  def change
    add_column :groupings, :company_id, :integer
  end
end
