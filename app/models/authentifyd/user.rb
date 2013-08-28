class Authentifyd::User < ActiveRecord::Base
  has_many :authentications, :dependent => :delete_all

  # Include default devise modules. Others available are:
  # :encryptable, :timeoutable and :omniauthable
  devise  :database_authenticatable
  devise  :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :lockable, :token_authenticatable, :timeoutable

  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :language

  ##
  # :method: before_create__:ensure_password_exists
  #
  # creates a password, allowing user to signup 
  # also creates a reset_password_token so that the user can be redirected to a reste_password url automatically
  #
  before_validation :generate_password_token, :confirm_if_already_confirmed

  before_save :store_language
  
  private

  # creates a password for the user if the password is not set
  # allowing registration via omniauth and with email only
  #
  # called before_validation
  #
  def generate_password_token
    unless self.encrypted_password && !self.encrypted_password.blank?
      pwd = Devise.friendly_token[0,20]
      self.password = pwd
      set_reset_password_token
    end
  end

  def set_reset_password_token
    # if is not created from omniauth, generate reset_password_token
    # we have also customized the confirmation logic to directly send a reset password
    self.reset_password_token = Devise.friendly_token[0,20] if self.reset_password_token.nil?
    self.reset_password_sent_at = Time.new
  end

  # sets confirmed_at to the user if the user is_already_confirmed
  #
  # called before_validation
  #
  def confirm_if_already_confirmed
    if self.email && self.authentications.any?
      new_record? ? skip_confirmation! : skip_reconfirmation!
    end
  end
  
  # sets the language with with the user has registered
  # 
  def store_language
    self.language ||= I18n.locale.to_s
  end

end