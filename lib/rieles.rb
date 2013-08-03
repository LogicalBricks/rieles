require 'rieles/version'
require 'rails'
require 'active_support/inflector/methods_override'
require 'config/initializer/inflections'

module Rieles
  I18n.load_path += Dir.glob( File.dirname(__FILE__) + "/config/locales/*.{rb,yml}" ) 

  class Railtie < ::Rails::Railtie
    config.app_generators do |g|
      g.templates.unshift File::expand_path('../templates', __FILE__)
    end 
  end

  class Engine < ::Rails::Engine
  end
end

