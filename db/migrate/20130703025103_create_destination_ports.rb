class CreateDestinationPorts < ActiveRecord::Migration
  def change
    create_table :destination_ports do |t|
      t.string :name

      t.timestamps
    end
  end
end
