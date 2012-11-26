module Authentifyd
  class ApplicationController < ActionController::Base
  end
end

class ActionController::Base
  def after_sign_out_path_for(resource_or_scope)
    session[:referrer] ? session[:referrer] : root_path
  end
end