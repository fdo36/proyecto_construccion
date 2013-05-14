class CreateKindsProducersTable < ActiveRecord::Migration
  def up
  	create_table :kinds_producers, :id => false do |t|
          t.references :kind
          t.foreign_key :kinds
          t.references :producer
          t.foreign_key :producers
      end
      add_index :kinds_producers, [:kind_id, :producer_id]
      add_index :kinds_producers, [:producer_id, :kind_id]
  end

  def down
  	drop_table :kinds_producers
  end
end
