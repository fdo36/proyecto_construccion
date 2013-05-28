class AddCodeToGroupingsProducers < ActiveRecord::Migration
  def change
    add_column :groupings_producers, :code, :string
  end
end
