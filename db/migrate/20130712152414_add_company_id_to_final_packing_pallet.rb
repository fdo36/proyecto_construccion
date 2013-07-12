class AddCompanyIdToFinalPackingPallet < ActiveRecord::Migration
  def change
    add_column :final_packing_pallets, :company_id, :integer
  end
end
