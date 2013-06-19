class AddCodeToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :code, :integer
  end
end
