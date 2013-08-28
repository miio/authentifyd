class Authentifyd::ConfirmationsController < Devise::ConfirmationsController
  include Localyzed::LocalyzedController

  layout "authentifyd/application"
end