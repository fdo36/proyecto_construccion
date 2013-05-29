class AddCodeToProducer < ActiveRecord::Migration
  def change
    add_column :producers, :code, :integer
  end
end
