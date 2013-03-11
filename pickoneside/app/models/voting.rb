class Voting < ActiveRecord::Base
  attr_accessible :option_id, :user_id

  belongs_to :option
  belongs_to :user
end
