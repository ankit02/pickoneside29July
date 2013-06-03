class Hit < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :war
  belongs_to :user
end
