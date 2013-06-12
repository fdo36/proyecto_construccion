class CreateTransitChamberIos < ActiveRecord::Migration
  def change
    create_table :transit_chamber_ios do |t|
      t.float :temperature
      t.integer :order_number

      t.timestamps
    end
  end
end
