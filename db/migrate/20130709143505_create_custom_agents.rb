class CreateCustomAgents < ActiveRecord::Migration
  def change
    create_table :custom_agents do |t|
      t.string :name

      t.timestamps
    end
  end
end
