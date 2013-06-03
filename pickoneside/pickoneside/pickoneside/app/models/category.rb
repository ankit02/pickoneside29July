class Category < ActiveRecord::Base
  attr_accessible :id, :topic

  has_many :wars

end
