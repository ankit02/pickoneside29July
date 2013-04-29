class RemoveForeignKeys2 < ActiveRecord::Migration
  def up
  	remove_foreign_key :wars, :categories
  	remove_foreign_key :options, :wars
  	remove_foreign_key :comments, :wars
  end

  def down
  end
end
