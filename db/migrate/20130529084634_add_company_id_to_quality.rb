class AddCompanyIdToQuality < ActiveRecord::Migration
  def change
    add_column :qualities, :company_id, :integer
  end
end
