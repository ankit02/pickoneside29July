class AddForeignKeyToWar < ActiveRecord::Migration
  def change
  	add_column :wars, :user_id, :Integer

  	add_foreign_key :wars, :users
  end
end
