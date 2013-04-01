class HomeController < ApplicationController
  
  def index
    render :text => (user_signed_in? ? "You are signed in" : "Hello World")
  end

end