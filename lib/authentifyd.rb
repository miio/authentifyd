require 'devise'
require "authentifyd/engine"

module Authentifyd

  mattr_accessor :devise_config
  def self.devise_config
    (@@devise_config || {}).reverse_merge({
      :registrations_controller   => 'Authentifyd::Registrations',
      :sessions_controller        => 'Authentifyd::Sessions'
    })
  end
end
