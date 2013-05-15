class AddDescToWars < ActiveRecord::Migration
  def change
    add_column :wars, :description, :string

       
  end
end
