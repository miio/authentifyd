class Authentifyd::UnlocksController < Devise::UnlocksController
  include Localyzed::LocalyzedController
  layout "authentifyd/application"
end