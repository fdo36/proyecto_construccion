class CreateDispatchContainers < ActiveRecord::Migration
  def change
    create_table :dispatch_containers do |t|
      t.integer :dispatch_id
      t.foreign_key :dispatches
      t.integer :container_id
      t.foreign_key :containers
      t.integer :quality_id
      t.foreign_key :qualities
      t.integer :variety_id
      t.foreign_key :varieties
      t.integer :quantity
      t.float :gross_weight

      t.timestamps
    end
  end
end
