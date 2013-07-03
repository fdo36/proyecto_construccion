class CreateOriginPorts < ActiveRecord::Migration
  def change
    create_table :origin_ports do |t|
      t.string :name

      t.timestamps
    end
  end
end
