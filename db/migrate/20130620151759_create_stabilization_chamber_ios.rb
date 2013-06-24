class CreateStabilizationChamberIos < ActiveRecord::Migration
  def change
    create_table :stabilization_chamber_ios do |t|
      t.float :temperature

      t.timestamps
    end
  end
end
