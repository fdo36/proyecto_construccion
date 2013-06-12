class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.string :name
      t.integer :subprocess_id
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps
    end
  end
end
