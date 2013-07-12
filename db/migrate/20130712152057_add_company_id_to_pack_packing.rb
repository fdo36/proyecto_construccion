class AddCompanyIdToPackPacking < ActiveRecord::Migration
  def change
    add_column :pack_packings, :company_id, :integer
  end
end
