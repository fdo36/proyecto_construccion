class AddCompanyIdToPackingProcess < ActiveRecord::Migration
  def change
    add_column :packing_processes, :company_id, :integer
  end
end
