class AddCompanyIdToOriginPort < ActiveRecord::Migration
  def change
    add_column :origin_ports, :company_id, :integer
  end
end
