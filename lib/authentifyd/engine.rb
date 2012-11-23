require 'rails'
require 'devise'
require 'devise-encryptable'

module Authentifyd
  class Engine < ::Rails::Engine
    isolate_namespace Authentifyd
  end
end
