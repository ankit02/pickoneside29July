class War < ActiveRecord::Base
  attr_accessible :topic, :description, :category_id, :options_test, :war_pic

  attr_accessor :options_test
  
  belongs_to :category
  belongs_to :user

  has_many :options, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :hits, :dependent => :destroy

  auto_strip_attributes :topic, :description, :options_test

  has_attached_file :war_pic, :styles => {:thumb => "800X500>", :small => "100X100>"}, :default_url => 'assets/default_#{size}.png'

  validates_presence_of :description
  validates :topic, :presence => true, :uniqueness => true
  # validates :war_pic, :file_size => { 
  #     :maximum => 1000000 
  #   }

  # validate :image_size

  # def image_size
  #   # errors.add(:field,'error message')
  #     errors[:war] << "Image size cannot be greater than 1MB." if :war_pic.size < 10.megabytes
        
  #   debugger
  # end

  
  # def file_size_validation
  #   errors[:war] << "should be less than 1MB" if war_pic.size > 1.megabytes
  # end

  def self.search(search)
  search.blank? ? [] : all(:conditions => ['topic LIKE ?', "%#{search.strip}%"])
  #War.paginate (:per_page => 2, :page => page)
  end

  def self.searchByCategory(searchByCategory)
    #debugger
  searchByCategory.blank? ? [] : all(:conditions => ['category_id = ?', searchByCategory])
  end

  def war_image(size)
  if war_pic.present?
    return war_pic.url(size)
  else
    return "/assets/default_#{size}.png"
  end


end

  #before_validation :strip_whitespace, :only => [:topic, :description, :options_test]

  #private
  #	def strip_whitespace(value)
   # 	value.responds_to?('strip') ? value.strip : value
  #end

  #accepts_nested_attributes_for :options

end
