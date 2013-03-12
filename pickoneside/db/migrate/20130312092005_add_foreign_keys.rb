class AddForeignKeys < ActiveRecord::Migration
  def up


  	add_foreign_key :wars, :categories

  

  	add_foreign_key :options, :wars

  

  	add_foreign_key :comments, :wars

  

  	add_foreign_key :comments, :users

  

 	add_foreign_key :votings, :options

 

  	add_foreign_key :votings, :users

 

	add_foreign_key :hits, :users  	



	add_foreign_key :hits, :wars
	add_foreign_key :wars, :users
  end

  def down
  end
end
