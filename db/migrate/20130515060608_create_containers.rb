class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.string :name
      t.float :tare

      t.timestamps
    end
  end
end
