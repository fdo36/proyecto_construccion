class CreateContainersProducersTable < ActiveRecord::Migration
  def up
  	create_table :containers_producers, :id => false do |t|
          t.references :container
          t.foreign_key :containers
          t.references :producer
          t.foreign_key :producers
      end
      add_index :containers_producers, [:container_id, :producer_id]
      add_index :containers_producers, [:producer_id, :container_id]
  end

  def down
  	drop_table :containers_producers
  end
end
