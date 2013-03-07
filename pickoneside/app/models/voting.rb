class Voting < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :option
  belongs_to :user
end
