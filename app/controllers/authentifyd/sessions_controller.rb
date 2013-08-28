class Authentifyd::SessionsController < Devise::SessionsController
  include Localyzed::LocalyzedController
  layout "authentifyd/application"
  # before_filter :define_body_class

  before_filter :define_body_class
  private
  
  def define_body_class
    @body_class = "authentifyd_sessions_#{action_name}"
  end
  
end