class CreateWars < ActiveRecord::Migration
  def change
    create_table :wars do |t|

    	t.string :topic
    	   	

      t.timestamps
    end
  end
end
