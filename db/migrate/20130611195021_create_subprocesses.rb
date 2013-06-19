class CreateSubprocesses < ActiveRecord::Migration
  def change
    create_table :subprocesses do |t|
      t.string :name
      t.integer :process_id

      t.timestamps
    end
  end
end
