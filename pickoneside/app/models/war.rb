class War < ActiveRecord::Base
  attr_accessible :topic, :description, :category_id, :options_test

  attr_accessor :options_test
  
  belongs_to :category
  belongs_to :user

  has_many :options
  has_many :comments
  has_many :hits

  auto_strip_attributes :topic, :description, :options_test

  def self.search(search)
  search.blank? ? [] : all(:conditions => ['topic LIKE ?', "%#{search.strip}%"])
  end

  def self.searchByCategory(searchByCategory)
    #debugger
  searchByCategory.blank? ? [] : all(:conditions => ['category_id = ?', searchByCategory])
  end

  #before_validation :strip_whitespace, :only => [:topic, :description, :options_test]

  #private
  #	def strip_whitespace(value)
   # 	value.responds_to?('strip') ? value.strip : value
  #end

  #accepts_nested_attributes_for :options

end
