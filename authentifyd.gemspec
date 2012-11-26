# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'authentifyd/version'

Gem::Specification.new do |s|
  s.name        = 'authentifyd'
  s.version     = Authentifyd::VERSION
  s.authors     = ['NicoArbogast']
  s.email       = ['nicolas.arbogast@gmail.com']
  s.homepage    = 'https://github.com/NicoArbogast/authentifyd.git'
  s.summary     = "Devise + Omniauth Authentication encapsulated in an Engine."
  s.description     = "Devise + Omniauth Authentication encapsulated in an Engine. Uses Devise. Parts taken from perens-instant-user and sso-devise-omniauth-provider"

  s.files = Dir["{app,config,db,lib}/**/*"] + Dir["{app,config,db,lib}/**/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8"
  # s.add_dependency "jquery-rails"
  # s.add_dependency 'haml'

  s.add_dependency 'devise', '2.1.2'
  s.add_dependency 'devise-encryptable'
  s.add_dependency 'omniauth'
  s.add_dependency 'omniauth-facebook', '1.4.0'
  s.add_dependency 'omniauth-twitter'

  s.add_development_dependency "mysql2"
  s.add_development_dependency "rspec-rails"
end
