class AddCompanyIdToPalletFinishedProduct < ActiveRecord::Migration
  def change
    add_column :pallet_finished_products, :company_id, :integer
  end
end
