class War < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :category

  has_many :options
  has_many :comments
  has_many :hits

end
