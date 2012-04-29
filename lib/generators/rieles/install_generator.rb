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
          copy_file 'index.html.erb', 'lib/templates/erb/scaffold/index.html.erb'
          copy_file 'edit.html.erb', 'lib/templates/erb/scaffold/edit.html.erb'
          copy_file 'new.html.erb', 'lib/templates/erb/scaffold/new.html.erb'
          copy_file 'show.html.erb', 'lib/templates/erb/scaffold/show.html.erb'
          copy_file '_form.html.erb', 'lib/templates/erb/scaffold/_form.html.erb'
          copy_file '../../../../app/views/application/_error_messages.html.erb', 'app/views/application/_error_messages.html.erb'
        end
      end

      private

      def file_name
        file_name = options.keep_current? ? 'inflections_es' : 'inflections'
      end
    end
end
