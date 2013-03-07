class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body

  has_many :wars
  has_many :comments
  has_many :votings
  has_many :hits

  validates_confirmation_of :password, message: "should match confirmation", if: :password
end
