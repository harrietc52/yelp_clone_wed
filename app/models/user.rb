
class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email =  auth.extra.raw_info.login  + "@github.com"
      user.password = Devise.friendly_token[0,20]
    end
  end

end

