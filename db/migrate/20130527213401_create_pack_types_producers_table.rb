class CreatePackTypesProducersTable < ActiveRecord::Migration
  def up
  	create_table :pack_types_producers, :id => false do |t|
          t.references :pack_type
          t.foreign_key :pack_types
          t.references :producer
          t.foreign_key :producers
      end
      add_index :pack_types_producers, [:pack_type_id, :producer_id]
      add_index :pack_types_producers, [:producer_id, :pack_type_id]
  end

  def down
  	drop_table :pack_types_producers
  end
end
