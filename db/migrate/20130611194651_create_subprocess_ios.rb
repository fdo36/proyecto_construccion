class CreateSubprocessIos < ActiveRecord::Migration
  def change
    create_table :subprocess_ios do |t|
      t.integer :packing_pallet_id
      t.datetime :io_datetime
      t.boolean :direction
      t.integer :worker_id
      t.integer :subprocess_id

      t.timestamps
    end
  end
end
