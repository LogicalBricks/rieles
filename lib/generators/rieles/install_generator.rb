# encoding: UTF-8
require 'rails/generators'

module Rieles
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../templates/erb/scaffold', __FILE__)
      class_option :keep_current_inflections,
        :type => :boolean,
        :default => false,
        :desc => 'Indica si en lugar de tratar de sobreescribir el archivo de inflections, se debe crear un archivo adicional (inflections_es)'
      class_option :skip_templates,
        :type => :boolean,
        :default => false,
        :desc => 'Indica si debe omitir los templates de las vistas para el scaffold'

      def copy_files
        copy_file '../../../config/initializer/inflections.rb', "config/initializers/#{file_name}.rb"
        copy_file '../../../config/locales/es.yml', 'config/locales/es.yml'

        unless options.skip_templates?
          copy_file("index.html.#{engine_extension}", 
                    "lib/templates/erb/scaffold/index.html.#{engine_extension}")
          copy_file("edit.html.#{engine_extension}", 
                    "lib/templates/erb/scaffold/edit.html.#{engine_extension}")
          copy_file("new.html.#{engine_extension}", 
                    "lib/templates/erb/scaffold/new.html.#{engine_extension}")
          copy_file("show.html.#{engine_extension}", 
                    "lib/templates/erb/scaffold/show.html.#{engine_extension}")
          copy_file("_form.html.#{engine_extension}", 
                    "lib/templates/erb/scaffold/_form.html.#{engine_extension}")
          copy_file("../../../../app/views/application/_error_messages.html.#{engine_extension}",
                    "app/views/application/_error_messages.html.#{engine_extension}")
        end
      end

      ####################
      private
      ####################

      def file_name
        file_name = options.keep_current? ? 'inflections_es' : 'inflections'
      end

      def engine_extension
        @engine_extension ||= get_extension
      end

      def get_extension
        ::Rails.application.config.generators.options[:rails][:template_engine] || 'erb'
      end

    end
end
