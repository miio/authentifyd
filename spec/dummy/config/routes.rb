Rails.application.routes.draw do
  root :to => "home#index"

  mount Authentifyd::Engine => Authentifyd.path
end
