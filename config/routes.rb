Authentifyd::Engine.routes.draw do
  root :to => redirect("/")

  devise_for :users, {
    class_name:		'Authentifyd::User',
    module: :devise,
    controllers: {  registrations: Authentifyd.devise_config[:registrations_controller],
                    sessions: Authentifyd.devise_config[:sessions_controller]}
  }

  match "#{Authentifyd.path}/auth/:provider/callback", :controller => 'Authentications', :action => "create"
  match "#{Authentifyd.path}/auth/failure", :controller => 'Authentications', :action => "failure"

  match "#{Authentifyd.path}/authentications/:user_id/link", :controller => 'Authentications', :action => "link", :as => :link_accounts
  match "#{Authentifyd.path}/authentications/:user_id/add", :controller => 'Authentications', :action => "add", :as => :add_account
end