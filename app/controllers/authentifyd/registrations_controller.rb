class Authentifyd::RegistrationsController < Devise::RegistrationsController
  def new
    # Building the resource with information that MAY BE available from omniauth!
    build_resource(:email => session[:omniauth_email])
    render :new
  end

  def create
    build_resource

    if session[:omniauth] && @user.errors[:email][0] =~ /has already been taken/
      user = Authentifyd::User.find_by_email(@user.email)
      # Link Accounts - if via social connect
      return redirect_to link_accounts_url(user.id)
    end

    # normal processing
    super
    session[:omniauth] = nil unless @user.new_record?
  end

  def build_resource(*args)
    super

    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end
end