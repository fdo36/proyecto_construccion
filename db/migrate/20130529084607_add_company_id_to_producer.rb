class AddCompanyIdToProducer < ActiveRecord::Migration
  def change
    add_column :producers, :company_id, :integer
  end
end
