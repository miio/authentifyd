require 'devise'
require "omniauth"
require 'omniauth-facebook'
require 'omniauth-twitter'
require 'omniauth-google-oauth2'
require "haml"
require 'localyzed'

require "authentifyd/engine"


module Authentifyd

  mattr_accessor :devise_config, :omniauth_config, :path, :path_prefix, :custom_head_snippet, :custom_bottom_snippet, :top_navbar_snippet

  def self.devise_config
    (@@devise_config || {}).reverse_merge({
      :registrations_controller   => 'authentifyd/registrations',
      :sessions_controller        => 'authentifyd/sessions',
      :confirmations_controller   => 'authentifyd/confirmations',
      :passwords_controller       => 'authentifyd/passwords',
      :unlocks_controller         => 'authentifyd/unlocks'
    })
  end

  def self.path
    @@path ||= "/"
  end

  def self.embeddable_callback_path(_path)
    (Authentifyd.path_prefix ?  "#{Authentifyd.path_prefix}/" : '') + Authentifyd.path + _path
  end
  
  def self.configure(config = {})
    @@custom_head_snippet = config[:custom_head_snippet]
    @@custom_bottom_snippet = config[:custom_bottom_snippet]
    @@top_navbar_snippet = config[:top_navbar_snippet]
  end
end