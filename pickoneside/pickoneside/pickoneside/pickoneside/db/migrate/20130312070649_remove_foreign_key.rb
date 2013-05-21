class RemoveForeignKey < ActiveRecord::Migration
  def up

  	#remove_foreign_key :wars, :categories

  	#add_column :options, :war_id, :Integer

  	#remove_foreign_key :options, :wars

  	#add_column :comments, :war_id, :Integer

  	#remove_foreign_key :comments, :wars

  	#add_column :comments, :user_id, :Integer

  	#remove_foreign_key :comments, :users

  	#add_column :votings, :option_id, :Integer

 	#remove_foreign_key :votings, :options

 	#add_column :votings, :user_id, :Integer

  	#remove_foreign_key :votings, :users

  	#add_column :hits, :user_id, :Integer

	#remove_foreign_key :hits, :users  	

	#add_column :hits, :war_id, :Integer

	#remove_foreign_key :hits, :wars

	#remove_foreign_key :wars, :users
  end

  def down
  end
end
