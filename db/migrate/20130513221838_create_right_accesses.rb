class CreateRightAccesses < ActiveRecord::Migration
  def change
    create_table :right_accesses do |t|
      t.string :model_name
      t.integer :right

      t.timestamps
    end
  end
end
