class AddForeignKeys2 < ActiveRecord::Migration
  def up

  	#add_column :wars, :category_id, :Integer

  	#add_foreign_key :wars, :categories

  	#add_column :options, :war_id, :Integer

  	#add_foreign_key :options, :wars

  	#add_column :comments, :war_id, :Integer

  	#add_foreign_key :comments, :wars

  	#add_column :comments, :user_id, :Integer

  	add_foreign_key :comments, :users

  	add_column :votings, :option_id, :Integer

 	add_foreign_key :votings, :options

 	add_column :votings, :user_id, :Integer

  	add_foreign_key :votings, :users

  	add_column :hits, :user_id, :Integer

	add_foreign_key :hits, :users  	

	add_column :hits, :war_id, :Integer

	add_foreign_key :hits, :wars


add_column :wars, :user_id, :Integer

  	add_foreign_key :wars, :users
  end

  def down
  end
end
