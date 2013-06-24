class CreateProductionProcessIos < ActiveRecord::Migration
  def change
    create_table :production_process_ios do |t|
      t.integer :order_number
      t.float :production_lines_number

      t.timestamps
    end
  end
end
