class AddWarPicToWars < ActiveRecord::Migration
  def change
  	add_attachment :wars, :war_pic
  end
end
