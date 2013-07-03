class CreateStoreFinishProducts < ActiveRecord::Migration
  def change
    create_table :store_finish_products do |t|
      t.datatime :time_out
      t.string :store_time

      t.timestamps
    end
  end
end
