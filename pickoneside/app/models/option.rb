class Option < ActiveRecord::Base
   attr_accessible :option

  belongs_to :war
  has_many :votings
end
