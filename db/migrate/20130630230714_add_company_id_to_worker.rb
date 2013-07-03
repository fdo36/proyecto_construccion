class AddCompanyIdToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :company_id, :integer
  end
end
