class AddAtributesToStabilizationChamberIo < ActiveRecord::Migration
  def change
    add_column :stabilization_chamber_ios, :order_number, :integer
    add_column :stabilization_chamber_ios, :heir_id, :integer
    add_column :stabilization_chamber_ios, :heir_type, :string
  end
end
