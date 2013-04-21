require 'rails'
require 'devise'
require 'devise-encryptable'

module Authentifyd
  class Engine < ::Rails::Engine
    isolate_namespace Authentifyd
    
    config.authentifyd = ActiveSupport::OrderedOptions.new

    initializer "authentifyd.configure" do |app|
      Authentifyd.configure(app.config.authentifyd)
    end
  
  end
end
