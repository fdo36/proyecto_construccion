class CreateDispatches < ActiveRecord::Migration
  def change
    create_table :dispatches do |t|
      t.string :code
      t.integer :destination_id
      t.foreign_key :destinations
      t.integer :kind_id
      t.foreign_key :kinds
      t.date :date
      t.datetime :hour

      t.timestamps
    end
  end
end
