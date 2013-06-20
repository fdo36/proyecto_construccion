class AddCodeToDestination < ActiveRecord::Migration
  def change
		def up
	    add_column :destinations, :code, :integer
		end
		def down
		  add_column :destinations, :code, :string
		end
  end
end
