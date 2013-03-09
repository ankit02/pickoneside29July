class War < ActiveRecord::Base
  attr_accessible :topic, :description, :category_id, :option_ids


  
  belongs_to :category
  belongs_to :user

  has_many :options
  has_many :comments
  has_many :hits

  accepts_nested_attributes_for :options

end
