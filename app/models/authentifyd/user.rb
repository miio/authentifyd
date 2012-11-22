class Authentifyd::User < ActiveRecord::Base
  has_many :authentications, :dependent => :delete_all

  # Include default devise modules. Others available are:
  # :encryptable, :timeoutable and :omniauthable
  devise :database_authenticatable, :encryptable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :token_authenticatable, :timeoutable

  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end

# FIXME - to put in sso_provider
# class User < ActiveRecord::Base
#   has_many :access_grants, :dependent => :delete_all
#   self.token_authentication_key = "oauth_token"
#   def self.find_for_token_authentication(conditions)
#     where(["access_grants.access_token = ? AND (access_grants.access_token_expires_at IS NULL OR access_grants.access_token_expires_at > ?)", conditions[token_authentication_key], Time.now]).joins(:access_grants).select("users.*").first
#   end
# end