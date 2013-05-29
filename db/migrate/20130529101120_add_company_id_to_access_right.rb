class AddCompanyIdToAccessRight < ActiveRecord::Migration
  def change
    add_column :access_rights, :company_id, :integer
  end
end
