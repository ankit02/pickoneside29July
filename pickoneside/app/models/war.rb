class War < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :category
  belongs_to :user

  has_many :options
  has_many :comments
  has_many :hits

end
