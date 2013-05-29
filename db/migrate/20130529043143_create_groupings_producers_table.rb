class CreateGroupingsProducersTable < ActiveRecord::Migration
  def up
      create_table :groupings_producers do |t|
          t.references :grouping
          t.foreign_key :groupings
          t.references :producer
          t.foreign_key :producers
      end
      add_index :groupings_producers, [:grouping_id, :producer_id]
      add_index :groupings_producers, [:producer_id, :grouping_id]
  end

  def down
      drop_table :groupings_producers
  end
end
