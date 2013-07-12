class AddCompanyIdToDestinationPort < ActiveRecord::Migration
  def change
    add_column :destination_ports, :company_id, :integer
  end
end
