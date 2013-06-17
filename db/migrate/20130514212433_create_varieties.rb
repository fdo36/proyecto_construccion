class CreateVarieties < ActiveRecord::Migration
  def change
    create_table :varieties do |t|
      t.string :name
      t.integer :kind_id
      t.foreign_key :kinds
      t.foreign_key :final_packing_pallets
      t.timestamps
    end
  end
end
