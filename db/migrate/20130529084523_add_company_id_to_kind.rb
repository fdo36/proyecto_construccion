class AddCompanyIdToKind < ActiveRecord::Migration
  def change
    add_column :kinds, :company_id, :integer
  end
end
