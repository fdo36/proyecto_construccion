class AddCompanyIdToFormatPacking < ActiveRecord::Migration
  def change
    add_column :format_packings, :company_id, :integer
  end
end
