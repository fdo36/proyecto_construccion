class CreateDispatches < ActiveRecord::Migration
  def change
    create_table :dispatches do |t|
      t.string :code
      t.integer :destination_id
      t.foreign_key :destinations
      t.integer :kind_id
      t.foreign_key :kinds
      t.datetime :dispatch_datetime

      t.timestamps
    end
  end
end
