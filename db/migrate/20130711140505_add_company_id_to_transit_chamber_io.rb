class AddCompanyIdToTransitChamberIo < ActiveRecord::Migration
  def change
    add_column :transit_chamber_ios, :company_id, :integer
  end
end
