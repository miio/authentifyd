Authentifyd::Engine.routes.draw do
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

  get "authentications/:user_id/link", :controller => 'authentications', :action => "link", :as => :link_accounts
  get "authentications/:user_id/add", :controller => 'authentications', :action => "add", :as => :add_account
  
  get "authentications", :controller => 'authentications', :action => "index", :as => :accounts
  delete "authentications/:id", controller: 'authentications', action: "destroy", as: :destroy_account
  
  root :to => "authentications#index"
  #root :to => redirect("/")
end

# prefix_on_default_locale => /:controller will not respond to request, only /:locale/:controller will
# => that is why we need to ad a block below with the redirect mechanism for all requests without :locale
Localyzed.localyze_routes('config/locales/authentifyd/routes.yml', { :prefix_on_default_locale => true, :custom_route_set => Authentifyd::Engine.routes, :keep_untranslated_routes => true }) #, :uniq_translated_root => true})

Authentifyd::Engine.routes.draw do
  get "auth/:provider/callback", :controller => 'authentications', :action => "create"
  get "auth/failure", :controller => 'authentications', :action => "failure"
end
