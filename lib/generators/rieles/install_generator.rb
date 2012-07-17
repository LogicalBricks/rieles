# encoding: UTF-8
require 'rails/generators'

module Rieles
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../../templates", __FILE__)
    class_option :keep_current_inflections,
    :type => :boolean,
    :default => false,
    :desc => 'Indica si en lugar de tratar de sobreescribir el archivo de inflections, se debe crear un archivo adicional (inflections_es)'
    class_option :skip_templates,
      :type => :boolean,
      :default => false,
      :desc => 'Indica si debe omitir los templates de las vistas para el scaffold'

    def copy_files
      copy_file '../config/initializer/inflections.rb', "config/initializers/#{file_name}.rb"
      copy_file '../config/locales/es.yml', 'config/locales/es.yml'

      unless options.skip_templates?
        copy_file(
          "#{engine}/scaffold/index.html.#{engine}", 
          "lib/templates/#{engine}/scaffold/index.html.#{engine}"
        )
        copy_file(
          "#{engine}/scaffold/edit.html.#{engine}", 
          "lib/templates/#{engine}/scaffold/edit.html.#{engine}"
        )
        copy_file(
          "#{engine}/scaffold/new.html.#{engine}", 
          "lib/templates/#{engine}/scaffold/new.html.#{engine}"
        )
        copy_file(
          "#{engine}/scaffold/show.html.#{engine}", 
          "lib/templates/#{engine}/scaffold/show.html.#{engine}"
        )
        copy_file(
          "#{engine}/scaffold/_form.html.#{engine}", 
          "lib/templates/#{engine}/scaffold/_form.html.#{engine}"
        )
        copy_file(
          "../../app/views/application/_error_messages.html.#{engine}",
          "app/views/application/_error_messages.html.#{engine}"
        )
      end
    end

    ####################
    private
    ####################

    def file_name
      options.keep_current? ? 'inflections_es' : 'inflections'
    end

    def engine
      @engine_extension ||= view_engine
    end

    def view_engine
      ::Rails.application.config.generators.options[:rails][:template_engine] || 'erb'
    end

  end
end
