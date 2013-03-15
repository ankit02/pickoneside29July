class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :profile_pic

  has_attached_file :profile_pic, :styles => {:thumb => "100X100>", :small => "40X40>"}, :default_url => 'assets/default_#{size}.jpg'

  # attr_accessible :title, :body

  def user_image(size="small")
	if profile_pic.present?
		return profile_pic.url(size)
	else
		return "/assets/default_#{size}.jpg"
	end
end
end
