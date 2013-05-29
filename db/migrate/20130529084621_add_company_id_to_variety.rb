class AddCompanyIdToVariety < ActiveRecord::Migration
  def change
    add_column :varieties, :company_id, :integer
  end
end
