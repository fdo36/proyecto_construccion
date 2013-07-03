class AddDispatchGuideNumberToSuppliesProvidersLoan < ActiveRecord::Migration
  def change
    add_column :supplies_providers_loans, :dispatch_guide_number, :integer
  end
end
