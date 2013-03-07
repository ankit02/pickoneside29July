class Option < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :war
  has_many :votings
end
