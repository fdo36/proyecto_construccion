class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.integer :rut
      t.string :first_name
      t.string :last_name
      t.integer :phone

      t.timestamps
    end
  end
end
