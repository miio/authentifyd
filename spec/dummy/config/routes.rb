Rails.application.routes.draw do

  mount Authentifyd::Engine => "/"
end
