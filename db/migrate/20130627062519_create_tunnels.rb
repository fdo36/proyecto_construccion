class CreateTunnels < ActiveRecord::Migration
  def change
    create_table :tunnels do |t|
      t.string :name

      t.timestamps
    end
  end
end
