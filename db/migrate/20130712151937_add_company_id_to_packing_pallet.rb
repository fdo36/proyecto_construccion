class AddCompanyIdToPackingPallet < ActiveRecord::Migration
  def change
    add_column :packing_pallets, :company_id, :integer
  end
end
