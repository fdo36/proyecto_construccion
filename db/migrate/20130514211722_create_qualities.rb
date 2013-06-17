class CreateQualities < ActiveRecord::Migration
  def change
    create_table :qualities do |t|
      t.string :name
      t.foreign_key :final_packing_pallets
      t.timestamps
    end
  end
end
