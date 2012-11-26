class Authentifyd::HomeController < Devise::SessionsController
  def index
    if user_signed_in?
      render :text => "You are signed in"
    else
      render :text => "Hello World"
    end
  end
end