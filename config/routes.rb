Authentifyd::Engine.routes.draw do
  devise_for :users, {
    class_name:		'Authentifyd::User',
    module: :devise,
    controllers: {  registrations: Authentifyd.devise_config[:registrations_controller],
                    sessions: Authentifyd.devise_config[:sessions_controller]}
  }

  match '/auth/:provider/callback', :to => 'authentications#create'
  match '/auth/failure', :to => 'authentications#failure'

  match 'authentications/:user_id/link' => 'authentications#link', :as => :link_accounts
  match 'authentications/:user_id/add' => 'authentications#add', :as => :add_account
  root :to => 'home#index'
end