class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :profile_pic, :provider, :uid, :fb_image

  has_attached_file :profile_pic, :styles => {:small=> "100X100>", :thumb => "40X40>"}, :default_url => 'assets/default_profilepic_#{size}.png'

  # attr_accessible :title, :body

  has_many :hits, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all
  has_many :votings, :dependent => :delete_all

  validates :username, :presence => true, :uniqueness => true

  def user_image(size)
	if profile_pic.present?
		return profile_pic.url(size)
	else
    if fb_image.present?
      return fb_image
    else
		return "/assets/default_profilepic_#{size}.png"
	end
end
end

def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
  
  unless user
    user = User.new(username:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         fb_image:auth.info.image,
                         password:Devise.friendly_token[0,20]
                         )
    user.skip_confirmation!
    #user.confirm!
    user.save
  end
  user.fb_image = auth.info.image
  user.skip_confirmation!
  user.save
  user
end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] 
        user.profile_pic = auth.info.image.split("=")[0] << "=small" if user.email.blank?
      end
    end
  end

  def send_confirmation_instructions
  # if invited_at.present?
    self.confirmation_token = nil if reconfirmation_required?
    @reconfirmation_required = false

    generate_confirmation_token! if self.confirmation_token.blank?
    # self.devise_mailer.confirmation_instructions(self).deliver
    Devise::Mailer.confirmation_instructions(@user).deliver
  # end
end

end

