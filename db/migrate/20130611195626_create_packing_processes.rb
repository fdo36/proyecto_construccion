class CreatePackingProcesses < ActiveRecord::Migration
  def change
    create_table :packing_processes do |t|
      t.string :name

      t.timestamps
    end
  end
end
