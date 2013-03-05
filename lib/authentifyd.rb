require 'devise'
require "omniauth"
require 'omniauth-facebook'
require 'omniauth-twitter'
require "authentifyd/engine"

module Authentifyd

  mattr_accessor :devise_config, :omniauth_config, :path, :path_prefix, :custom_css, :custom_js

  def self.devise_config
    (@@devise_config || {}).reverse_merge({
      :registrations_controller   => 'Authentifyd::Registrations',
      :sessions_controller        => 'Authentifyd::Sessions'
    })
  end

  def self.path
    @@path ||= "/"
  end

  def self.embeddable_callback_path(_path)
    (Authentifyd.path_prefix ?  "#{Authentifyd.path_prefix}/" : '') + Authentifyd.path + _path
  end
end