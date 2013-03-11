class Option < ActiveRecord::Base
   attr_accessible :option, :war_id

  belongs_to :war
  has_many :votings
end
