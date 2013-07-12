class AddCompanyIdToSubprocessIo < ActiveRecord::Migration
  def change
    add_column :subprocess_ios, :company_id, :integer
  end
end
