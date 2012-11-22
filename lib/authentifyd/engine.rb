require 'rails'
require 'devise'

module Authentifyd
  class Engine < ::Rails::Engine
    isolate_namespace Authentifyd
  end
end
