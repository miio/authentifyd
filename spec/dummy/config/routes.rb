Rails.application.routes.draw do

  mount Authentifyd::Engine => "/"
  root :to => "home#index"
end
