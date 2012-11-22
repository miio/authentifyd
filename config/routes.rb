Authentifyd::Engine.routes.draw do
  devise_for :users, {
    class_name:		'Authentifyd::User',
    module: :devise,
  }
end
