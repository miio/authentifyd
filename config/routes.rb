Authentifyd::Engine.routes.draw do
  devise_for :users, {
    class_name:		'Authentifyd::User',
    module: :devise,
    controllers: {  registrations: Authentifyd.devise_config[:registrations_controller],
                    sessions: Authentifyd.devise_config[:sessions_controller]}
  }

  match 'auth/:provider/callback', :controller => 'Authentifyd::Authentications', :action => "create"
  match 'auth/failure', :controller => 'Authentifyd::Authentications', :action => "failure"

  match 'authentications/:user_id/link', :controller => 'Authentifyd::Authentications', :action => "link", :as => :link_accounts
  match 'authentications/:user_id/add', :controller => 'Authentifyd::Authentications', :action => "add", :as => :add_account
  root :to => 'home#index'
end