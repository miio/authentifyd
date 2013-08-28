class Authentifyd::PasswordsController < Devise::PasswordsController
  include Localyzed::LocalyzedController
  layout "authentifyd/application"
end