Authentifyd::Engine.routes.draw do
  root :to => redirect("/")

  devise_for :users, {
    class_name:		'Authentifyd::User',
    module: :devise,
    controllers: {  registrations: Authentifyd.devise_config[:registrations_controller],
                    sessions: Authentifyd.devise_config[:sessions_controller],
                    confirmations: Authentifyd.devise_config[:confirmations_controller],
                    passwords: Authentifyd.devise_config[:passwords_controller],
                    unlocks: Authentifyd.devise_config[:unlocks_controller]
                  }
  }

  match "auth/:provider/callback", :controller => 'Authentications', :action => "create"
  match "auth/failure", :controller => 'Authentications', :action => "failure"

  match "authentications/:user_id/link", :controller => 'Authentications', :action => "link", :as => :link_accounts
  match "authentications/:user_id/add", :controller => 'Authentications', :action => "add", :as => :add_account
  match "authentications", :controller => 'Authentications', :action => "index", :as => :accounts
  match "authentications/:id", controller: 'Authentications', action: "destroy", method: :delete, as: :destroy_account
end