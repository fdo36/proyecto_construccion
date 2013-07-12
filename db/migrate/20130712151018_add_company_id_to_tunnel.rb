class AddCompanyIdToTunnel < ActiveRecord::Migration
  def change
    add_column :tunnels, :company_id, :integer
  end
end
